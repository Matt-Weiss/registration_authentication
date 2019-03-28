require 'rails_helper'

RSpec.describe 'When a visitor creates a new account' do
  it 'contains a form for them to fill out' do

    visit new_user_path
    expect(page).to have_content("Name:")
    expect(page).to have_content("Email:")
    expect(page).to have_content("Password:")

    fill_in 'user[name]', with: 'Matt Weiss2'
    fill_in 'user[email]', with: 'generic2@email.com'
    fill_in 'user[password]', with: 'generic_password2'
    click_on 'Create User'
    expect(current_path).to eq(users_path)

  end
end
