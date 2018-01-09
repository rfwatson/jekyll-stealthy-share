require 'jekyll'
require 'jekyll/stealthy_share'

Liquid::Template.register_tag('stealthy_share_buttons', Jekyll::StealthyShare::Tag)
Liquid::Template.register_tag('stealthy_share_assets', Jekyll::StealthyShare::AssetTag)
