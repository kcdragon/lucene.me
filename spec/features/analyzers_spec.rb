require 'spec_helper'

feature 'analyzers' do

  scenario 'display tokens for analyzer' do
    visit analyzers_path

    fill_in :text, with: "Foo Bar"
    check 'analyzer_whitespace'
    click_button 'analyze'

    page.should have_content '[Foo]'
    page.should have_content '[Bar]'
  end
end
