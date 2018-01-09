## jekyll-stealthy-share

[![Build Status](https://travis-ci.org/rfwatson/jekyll-stealthy-share.svg?branch=master)](https://travis-ci.org/rfwatson/jekyll-stealthy-share)

This is a [Jekyll](https://jekyllrb.com/) plugin that adds a Liquid tag to inject share buttons into your blog.

The share buttons are HTML-only and trigger no JavaScript, so they won't track your blog's on behalf of Facebook, Twitter, Reddit or whoever else.

The injected HTML and CSS is simple and easy to customize or extend.

See it in action on https://netflux.io.

## Installation

Add `jekyll-stealthy-share` to your blog's Gemfile:

```ruby
group :jekyll_plugins do
  gem 'jekyll-stealthy-share', git: 'https://github.com/rfwatson/jekyll-stealthy-share.git'
end
```

And add it to your `_config.yml`:

```yaml
plugins:
  - jekyll-stealthy-share
```

## Usage

Somewhere in your layout (for example `_includes/head.html`), include the share button CSS:

```html
{% stealthy_share_assets %}
```

To inject the share buttons into your post, use this tag:

```html
{% stealthy_share_buttons %}
```

## Customizing/adding/removing buttons

To re-order or remove buttons, you can pass arguments to the liquid tag. For example:

```html
{% stealthy_share_buttons: facebook, twitter, reddit %}
```

It's also possible to add new templates of your own. If a directory `_includes/share_buttons` exists in your site's root folder, `jekyll-stealthy-share` will read templates from this location instead.

See the [`_includes` directory](https://github.com/rfwatson/jekyll-stealthy-share/tree/master/_includes) for an idea of the expected layout of each template. Additionally, you could choose to not include `{% stealthy_share_assets %}` and write your own custom CSS.

## TODO

* Add more share button options
* Make customization of buttons easier (YAML file format to define?)
* Improve default styling
* Write unit tests

## Contributions

Welcome.

## Credits

The share button SVG templates, colours and some styling are all from http://sharingbuttons.io/.

## License

MIT

## Contact

rfwatson via GitHub
