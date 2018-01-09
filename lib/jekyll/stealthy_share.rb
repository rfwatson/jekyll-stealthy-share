require 'jekyll/stealthy_share/version'
require 'jekyll/stealthy_share/template'
require 'jekyll/stealthy_share/tag'
require 'jekyll/stealthy_share/asset_tag'
require 'jekyll/stealthy_share/generator'

module Jekyll
  module StealthyShare
    class << self
      attr_accessor :site

      def base_path
        File.join(File.dirname(__FILE__), '../..')
      end

      def templates_path
        return source_templates_path if File.directory?(source_templates_path)

        default_templates_path
      end

      private

      def default_templates_path
        File.join(base_path, '_includes')
      end

      def source_templates_path
        File.join(site.source, '_includes', 'share_buttons')
      end
    end
  end
end
