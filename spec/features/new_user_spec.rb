require 'rails_helper'

RSpec.describe 'When a visitor creates a new account' do
  it 'contains a form for them to fill out' do

    visit new_user_path
    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")

    fill_in 'user[name]' with: 'Matt Weiss'
    fill_in 'user[email]' with: 'generic@email.com' 
    fill_in 'user[password]' with: 'generic_password'
    click_on 'Submit'
    expect(current_path).to eq(users_path)

  end
end
