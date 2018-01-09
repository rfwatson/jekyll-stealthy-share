module Jekyll
  module StealthyShare
    class AssetTag < Liquid::Tag
      def render(context)
        %Q{<link rel="stylesheet" href="/assets/share.css">}
      end
    end
  end
end
