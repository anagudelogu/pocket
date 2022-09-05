require 'rails_helper'

RSpec.describe 'Sessions', type: :system do
  let(:user) { create(:user, email: 'email@example.com', password: 'password') }
  before do
    user.confirm
    visit new_user_session_path
  end

  scenario 'Signing in with the correct credentials' do
    within('form') do
      fill_in 'Email', with: 'email@example.com'
      fill_in 'Password', with: 'password'

      click_on 'Log in'
    end
    expect(page).to have_current_path(categories_path)
    expect(page).to have_content(/signed in successfully/i)
  end

  scenario 'Signing in with incorrect credentials' do
    within('form') do
      fill_in 'Email', with: 'incorrect@mail.com'
      fill_in 'Password', with: 'pass'

      click_on 'Log in'
    end
    expect(page).to have_content(/invalid/i)
  end

  let!(:user2) { create(:user, email: 'user@example.com', password: 'password') }

  scenario 'Signing in with correct credentials but not without confirming the email yet' do
    within('form') do
      fill_in 'Password', with: 'password'
      fill_in 'Email', with: 'user@example.com'

      click_on 'Log in'
    end

    expect(page).to have_content(/confirm your email/i)
  end
end
