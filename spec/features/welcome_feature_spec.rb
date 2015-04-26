require 'rails_helper'

feature 'welcome screen', js: true do
  it 'should open main page' do
    visit '/'

    expect(page).to have_text('List of books')
  end

  it 'should login when adding new book' do
    User.create!(email: "test@test.pl", password: "testtest")

    visit '/'
    click_link 'New book'

    expect(page).to have_text('Log in')

    fill_in('Email', with: "test@test.pl")
    fill_in('Password', with: "testtest")
    click_button('Log in')

    expect(page).to have_text('New book')
  end  
end