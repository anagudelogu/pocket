require 'rails_helper'

RSpec.describe 'Visiting the root path of the app', type: :system do
  before { visit root_path }

  context 'when theres no user logged in' do
    scenario 'Shows me the name of the app, one link to login and another one to sign up' do
      expect(page).to have_content(/pocket/i)
      expect(page).to have_link(text: /log in/i)
      expect(page).to have_link(text: /sign up/i)
    end

    scenario 'Clicking on Log in, gets me to the Login form' do
      click_link text: /log in/i

      expect(page).to have_current_path(new_user_session_path)
    end

    scenario 'Clicking on Sign up, gets me to the Sign up form' do
      click_link text: /sign up/i

      expect(page).to have_current_path(new_user_registration_path)
    end
  end

  context 'when theres an user logged in' do
    let(:user) { create(:user) }

    before do
      user.confirm
      sign_in(user)
      visit root_path
    end

    scenario "Doesn't show me the page and redirects me to my home page" do
      expect(page).to have_current_path(categories_path)
      expect(page).to have_content(/you are already logged in/i)
    end
  end
end
