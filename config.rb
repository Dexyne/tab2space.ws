# Settings

Time.zone = 'Paris'

set :site_name, '&rarr;Tab2Space&bull;'

set :slim, pretty: true

set :css_dir, 'assets/stylesheets'
set :js_dir, 'assets/javascripts'
set :images_dir, 'assets/images'

page '/feed.xml', layout: false
page 'CNAME', layout: false

###
# Blog settings
###

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  blog.prefix = 'articles'

  blog.permalink = "{year}/{month}/{day}/{title}.html"
  # Matcher for blog source files
  blog.sources = "{year}/{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = 'tag.html'
  blog.calendar_template = 'calendar.html'

  # Enable pagination
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = 'page/{num}'
end

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
helpers do
  def site_title(title)
    return title + ' | ' + site_name unless title.blank?
    site_name
  end

  def license_cc_by(text: false)
    string = link_to 'http://creativecommons.org/licenses/by/4.0/', rel: 'license' do
      image_tag 'https://i.creativecommons.org/l/by/4.0/88x31.png',
                alt: 'Licence Creative Commons',
                style: 'border-width:0'
    end
    # if text
    # string += '<br>'
    # string += 'Ce(tte) <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">œuvre</span> est mise à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Licence Creative Commons Attribution 4.0 International</a>.'
  end

  def license_cc_by_sa(text: false)
    string = link_to 'http://creativecommons.org/licenses/by-sa/4.0/', rel: 'license' do
      image_tag 'https://i.creativecommons.org/l/by-sa/4.0/88x31.png',
                alt: 'Licence Creative Commons',
                style: 'border-width:0'
    end
    # if text
    # <br />Ce(tte) <span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" rel="dct:type">œuvre</span> est mise à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Licence Creative Commons Attribution -  Partage dans les Mêmes Conditions 4.0 International</a>.
  end
end


# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Use WebP for pictures
  activate :webp

  # Use GitHub emoji
  activate :gemoji

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  ignore 'stylesheets/base/README.*'
  ignore 'stylesheets/layout/README.*'
  ignore 'stylesheets/modules/README.*'
  ignore 'stylesheets/states/README.*'
end

activate :deploy do |deploy|
  deploy.method = :git
  # Optional Settings
  deploy.remote = 'git@github.com:Dexyne/dexyne.github.io.git' # remote name or git url, default: origin
  deploy.branch = 'master' # default: gh-pages
  # deploy.strategy = :submodule # commit strategy: can be :force_push or :submodule, default: :force_push
  # deploy.commit_message = 'custom-message' # commit message (can be empty), default: Automated commit at `timestamp` by middleman-deploy `version`
  deploy.build_before = true
end
