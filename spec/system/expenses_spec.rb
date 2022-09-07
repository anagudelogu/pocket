require 'rails_helper'
#  rubocop:disable Metrics/BlockLength
RSpec.describe 'Visiting the expenses page', type: :system do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  context "when I'm not logged in" do
    scenario 'should redirect me to the login form' do
      visit category_expenses_path(category)

      expect(page).to have_content(/you need to sign in or sign up/i)
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context "When I'm logged in" do
    before do
      user.confirm
      sign_in(user)

      @e1 = create(:expense, author: user, amount: 20, name: 'first')
      @e2 = create(:expense, author: user, amount: 15, name: 'second')
      @e3 = create(:expense, author: user, amount: 20, name: 'last')

      category.expenses << [@e1, @e2, @e3]
      visit category_expenses_path(category)
    end

    scenario 'should show me the list of expenses ordered by most recent' do
      within('tbody') do
        expenses_elements = all('tr', count: 3)
        first_expense = expenses_elements.first
        expect(first_expense).to have_content(@e3.name)
      end
    end

    scenario 'should show me the amount of each expense' do
      within('tbody') do
        amount_elements = all('tr', count: 3)
        amounts = amount_elements.map(&:text)

        expect(amounts).to contain_exactly(/amount: \$ #{@e3.amount}/i,
                                           /amount: \$ #{@e2.amount}/i,
                                           /amount: \$ #{@e1.amount}/i)
      end
    end

    scenario 'should show me the total amount of the category' do
      total_amount_element = find('p', text: /total amount:/i)
      expect(total_amount_element).to have_content(/\$ #{category.total_amount}/i)
    end

    scenario 'Clicking on the back button gets me to the categories page' do
      click_on 'a', id: 'back-btn'

      expect(page).to have_current_path(categories_path)
    end

    scenario 'clicking on the add expense button gets me to the form to create an expense' do
      click_on text: /add expense/i

      expect(page).to have_current_path(new_category_expense_path(category))
    end
  end
end
#  rubocop:enable Metrics/BlockLength
