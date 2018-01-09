require 'liquid'

module Jekyll
  module StealthyShare
    class Tag < Liquid::Tag
      HTML = '.html'.freeze

      def initialize(tag_name, text, tokens)
        @text = text
      end

      def render(context)
        permalink = page(context)['url']
        title = page(context)['title']
        url = URI.join(base_url(context), permalink)

        buttons = templates.map do |template|
          liquid_template = Liquid::Template.parse(template)
          liquid_template.render(
            'url' => url.to_s,
            'title' => title.to_s
          )
        end

        container = Template.read('_container.html').first
        render_template(container, 'content' => buttons.join)
      end

      private

      def render_template(template, data)
        t = Liquid::Template.parse(template)
        t.render(data)
      end

      def templates
        basenames = @text.scan(/\w+/)
        basenames = Template.basenames if basenames.empty?

        basenames.map! do |basename|
          basename.end_with?(HTML) ? basename : basename + HTML
        end

        missing = basenames - Template.basenames
        if missing.any?
          raise "Unknown share button templates: #{missing.inspect}."
        end

        Template.read(*basenames)
      end

      def page(context)
        context.environments.first.page
      end

      def base_url(context)
        context.registers[:site].config['url']
      end
    end
  end
end
