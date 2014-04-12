require 'spec_helper'

feature 'analyzers' do

  scenario 'display tokens for analyzer' do
    visit '/'

    fill_in :text, with: "Foo Bar"
    select 'Whitespace', from: :analyzer
    click_button 'analyze'

    page.should have_content '[Foo]'
    page.should have_content '[Bar]'
  end
end
