require 'rails_helper'

feature 'Visitor signs up' do

  let (:attrs_for_sign_up) { { email: "Alex123@zz.com",
                                password: "dfgdfg345",
                                password_confirmation: "dfgdfg345",
                                name: "Alex",
                                phone: "+79142343434"}
                            }

  scenario 'with invalid email' do
    attrs_for_sign_up[:email] = "Alex"
    sign_up_with *attrs_for_sign_up.values

    expect(page).to have_content('Email is invalid')
  end

  scenario 'with blank password' do
    attrs_for_sign_up[:password] = ""
    sign_up_with *attrs_for_sign_up.values

    expect(page).to have_content("Password can't be blank")
  end

  scenario 'with valid email and password' do
    sign_up_with  *attrs_for_sign_up.values

    expect(page).to have_content('Welcome!')
  end

  def sign_up_with(email,
                    password,
                    password_confirmation,
                    name,
                    phone)
    visit new_user_registration_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password_confirmation
    fill_in 'user[name]', with: name
    fill_in 'user[phone]', with: phone
    click_button 'Sign up'
  end
end
