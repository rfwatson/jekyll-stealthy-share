module Helpers
  shared_context 'shared' do
    let(:config) do
      Jekyll.configuration(
        'source'      	=> source,
        'destination' 	=> File.expand_path('_site'),
        'url'         	=> 'http://www.example.com',
        'name'       		=> 'Test site',
        'plugins'       => ['jekyll-stealthy-share']
      )
    end

    let(:site) do
      Jekyll::Site.new(config)
    end

    before do
      site.process
      Capybara.app = Rack::File.new(site.dest)
    end
  end

  shared_context 'basic site' do
    include_context 'shared'

    let(:source) { File.expand_path('spec/support/fixtures/basic') }
  end

  shared_context 'a site with overrides' do
    include_context 'shared'

    let(:source) { File.expand_path('spec/support/fixtures/overrides') }
  end
end
