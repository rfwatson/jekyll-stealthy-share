require 'jekyll/generator'

module Jekyll
  module StealthyShare
    class Generator < Jekyll::Generator
      def generate(site)
        StealthyShare.site = site

        site.static_files << StaticFile.new(
          site,
          StealthyShare.base_path,
          'assets',
          'share.css'
        )
      end
    end
  end
end
