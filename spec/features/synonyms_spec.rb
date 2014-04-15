require 'spec_helper'

feature 'synoyms' do
  scenario 'checking synonyms' do
    visit synonyms_path

    fill_in :synonyms, with: 'foo, bar'
    fill_in :text, with: 'bar'
    click_button 'generate'

    page.should have_content '[foo]'
    page.should have_content '[bar]'
  end
end
