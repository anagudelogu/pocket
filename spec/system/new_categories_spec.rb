require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Visiting the new category page', type: :system do
  context "when I'm not logged in" do
    scenario 'should redirect me to the login form' do
      visit new_category_path

      expect(page).to have_content(/you need to sign in or sign up/i)
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context "When I'm logged in" do
    let(:user) { create(:user) }

    before do
      user.confirm
      sign_in(user)
      visit new_category_path
    end

    scenario 'I should see a form with Name and Icon fields, aswell as a submit button' do
      form = find('form', id: 'new-category')
      expect(form).to have_field('Name', type: 'text')
      expect(form).to have_field('Icon', type: 'text')
      expect(form).to have_button('Create Category', type: 'submit')
    end

    context "when I'm filling the form" do
      let(:form) { find('form', id: 'new-category') }

      scenario 'leaving name blank should display errors' do
        within(form) do
          fill_in 'Icon', with: 'https://via.placeholder.com/150x150/cccccc/969696?text=Not+Available'
          click_button 'Create Category'
        end

        expect(page).to have_content(/name can't be blank/i)
      end

      scenario 'leaving icon blank should display errors' do
        within(form) do
          fill_in 'Name', with: 'Some name'
          click_button 'Create Category'
        end

        expect(page).to have_content(/icon can't be blank/i)
      end

      scenario 'Filling both fields creates the category and gets me to the home page' do
        within(form) do
          fill_in 'Name', with: 'Some name'
          fill_in 'Icon', with: 'https://via.placeholder.com/150x150/cccccc/969696?text=Not+Available'
          click_button 'Create Category'
        end
        expect(page).to have_current_path(categories_path)
        within('#categories-list') do
          expect(all('li').size).to eq 1
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
