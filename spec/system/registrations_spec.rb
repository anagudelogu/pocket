require 'rails_helper'

RSpec.describe 'Registrations', type: :system do
  before { visit new_user_registration_path }

  scenario 'Filling in Name, email and password' do
    fill_in 'Name', with: 'Test'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content(/confirmation/i)
  end

  scenario 'Leaving Name blank should display errors' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content(/name can't be blank/i)
  end

  scenario 'Leaving Email blank should display errors' do
    fill_in 'Name', with: 'Test'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content(/email can't be blank/i)
  end

  scenario 'Leaving Password blank should display errors' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content(/password can't be blank/i)
  end
end
