require 'rails_helper'

RSpec.describe 'Visiting the root path of the app', type: :system do
  scenario 'Shows me the name of the app, one link to login and another one to sign up' do
    visit root_path

    expect(page).to have_content(/pocket/i)
    expect(page).to have_link(text: /log in/i)
    expect(page).to have_link(text: /sign up/i)
  end

  scenario 'Clicking on Log in, gets me to the Login form' do
    pending
    visit root_path

    click_link text: /log in/i

    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'Clicking on Sign up, gets me to the Sign up form' do
    pending
    visit root_path

    click_link text: /sign up/i

    expect(page).to have_current_path(new_user_registration_path)
  end
end
