require 'spec_helper'

describe 'wymeditor', :type => :feature do
  refinery_login
  # see https://github.com/refinery/refinerycms/pull/1583
  context "when switching locales" do
    before do
      allow(Refinery::I18n).to receive(:frontend_locales).and_return [:en, :ru]

      # Create a page in both locales
      about_page = Mobility.with_locale(:en) do
        Refinery::Page.create :title => 'About'
      end

      Mobility.with_locale(:ru) do
        about_page.title = 'About Ru'
        about_page.save
      end
    end

    let(:about_page) do
      page = Refinery::Page.last
      # we need page parts so that there's a visual editor
      Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
        page.parts.create(title: default_page_part[:title], slug: default_page_part[:slug], :body => nil, :position => index)
      end
      page
    end

    specify "dialog has correct links", js: true do
      visit refinery.edit_admin_page_path(about_page)

      find("#page_part_body .wym_tools_link a").click

      expect(page).to have_selector("iframe#dialog_frame")

      page.within_frame("dialog_frame") do
        expect(page).to have_content("About")
        expect(page).to have_css("a[href$='/about']")

        click_link "cancel_button"
      end

      within "#switch_locale_picker" do
        click_link "ru"
      end

      find("#page_part_body .wym_tools_link a").click

      expect(page).to have_selector("iframe#dialog_frame")

      page.within_frame("dialog_frame") do
        expect(page).to have_content("About Ru")
        expect(page).to have_css("a[href$='/ru/about-ru']")
      end
    end
  end
end
