require 'jekyll/stealthy_share'

RSpec.describe Jekyll::StealthyShare, type: :feature do
  subject { page }

  context 'on a basic site' do
    include_context 'basic site'

    context 'a page with share buttons injected' do
      before do
        visit '/2018/01/01/buttons.html'
      end

      it { is_expected.to have_css('.share_buttons') }
      it { is_expected.to have_content('Share this post') }

      it 'injects all buttons' do
        count = page.all('.share_buttons li').size
        expect(count).to eq 4
      end
    end

    context 'a page with no share buttons injected' do
      before do
        visit '/2018/01/02/no-buttons.html'
      end

      it { is_expected.not_to have_css('.share_buttons') }
      it { is_expected.not_to have_content('Share this:') }
    end
  end

  context 'a site with overrides' do
    include_context 'a site with overrides'

    context 'a page with share buttons injected' do
      before do
        visit '/2018/01/01/buttons.html'
      end

      it { is_expected.to have_css('.share_buttons') }
      it { is_expected.to have_content('Share this:') }
      it { is_expected.to have_content('Test button') }

      it 'injects all buttons' do
        count = page.all('.share_buttons li').size
        expect(count).to eq 1
      end
    end

    context 'a page with no share buttons injected' do
      before do
        visit '/2018/01/02/no-buttons.html'
      end

      it { is_expected.not_to have_css('.share_buttons') }
      it { is_expected.not_to have_content('Share this:') }
    end
  end
end
