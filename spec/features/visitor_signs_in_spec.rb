require 'rails_helper'

feature 'Visitor signs in' do

  given!(:user) { FactoryBot.create(:user) }

  scenario 'with wrong password' do
    user.password = "Azaza"
    sign_in

    expect(page).to have_content("Invalid Email or password")
  end

  scenario 'with valid email and password' do
    sign_in

    expect(page).to have_content('Signed in successfully')
  end

  def sign_in
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end
end
