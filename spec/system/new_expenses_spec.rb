require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Visiting new expenses page', type: :system do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  context "when I'm not logged in" do
    scenario 'should redirect me to the login form' do
      visit new_category_expense_path(category)

      expect(page).to have_content(/you need to sign in or sign up/i)
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context "when I'm logged in" do
    let(:form) { find('form', id: 'new-expense') }
    before do
      user.confirm
      sign_in(user)
      @c1 = create(:category, user:, name: 'test1')
      @c2 = create(:category, user:, name: 'test2')
      visit new_category_expense_path(category)
    end
    # Name field
    scenario 'should show me a field for Name' do
      expect(form).to have_field('Name', type: 'text')
    end
    # Amount field
    scenario 'should show me a field for Amount' do
      expect(form).to have_field('Amount', type: 'number')
    end
    # Categories
    scenario 'should show me checkboxes for Categories' do
      enabled_check_boxes = find_all(:field, type: 'checkbox', count: 2)
      enabled_check_boxes_values = enabled_check_boxes.map { |el| el.value.to_i }

      expect(enabled_check_boxes_values).to contain_exactly(@c1.id, @c2.id)
    end
    # Save btn
    context 'clicking on save button' do
      scenario 'with all fields filled, creates a new expense and gets me back to the expenses list' do
        within(form) do
          fill_in 'Name', with: 'Test name'
          fill_in 'Amount', with: 12.40

          click_on 'Create'
        end
        expect(page).to have_current_path(category_expenses_path(category))
        expect(page).to have_content(/Test name/i)
      end

      scenario 'with name field blank, display errors' do
        within(form) do
          fill_in 'Amount', with: 12.40
          click_on 'Create'
        end
        expect(page).to have_content(/name can't be blank/i)
      end

      scenario 'with amount field blank, display errors' do
        within(form) do
          fill_in 'Name', with: 'Test name'
          click_on 'Create'
        end
        expect(page).to have_content(/amount can't be blank/i)
      end
    end
    # Back btn
    scenario 'Clicking on the back button gets me to the expenses page for the category' do
      click_on 'a', id: 'back-btn'

      expect(page).to have_current_path(category_expenses_path(category))
    end
  end
end
# rubocop:enable Metrics/BlockLength
