require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe 'Visiting the categories page', type: :system do
  context "when I'm not logged in" do
    scenario 'should redirect me to the login form' do
      visit categories_path

      expect(page).to have_content(/you need to sign in or sign up/i)
      expect(page).to have_current_path(new_user_session_path)
    end
  end

  context "when I'm logged in" do
    let(:user) { create(:user) }

    before do
      user.confirm
      sign_in(user)
      @c1 = create(:category, user:, name: 'c1')
      @c2 = create(:category, user:, name: 'c2')
      visit categories_path
    end

    scenario 'should show me all categories names' do
      within('#categories-list') do
        name_elements = all('h3', count: 2)
        names = name_elements.map(&:text)
        expect(names).to contain_exactly(@c1.name, @c2.name)
      end
    end

    scenario 'should show me all categories icons' do
      within('#categories-list') do
        icon_elements = all('img', count: 2)
        icons = icon_elements.map { |element| element['src'] }

        expect(icons).to contain_exactly(@c1.icon, @c2.icon)
      end
    end

    scenario 'should show me the total amount of all transactions for that category' do
      e1 = create(:expense, author: user, amount: 20)
      e2 = create(:expense, author: user, amount: 15)
      e3 = create(:expense, author: user, amount: 20)

      @c1.expenses << [e1, e2]
      @c2.expenses << e3

      visit categories_path

      within('#categories-list') do
        total_elements = all('p', count: 2, text: /\$/i)
        totals = total_elements.map(&:text)

        expect(totals).to contain_exactly(/\$#{@c1.total_amount}/i, /\$#{@c2.total_amount}/i)
      end
    end

    scenario 'Clicking on new category takes me to a form to create a category' do
      click_on text: /new category/i

      expect(page).to have_current_path(new_category_path)
      expect(page).to have_selector('form', id: 'new-category')
    end

    scenario 'Clicking on a Category should lead to its expenses page' do
      click_on text: @c1.name

      expect(page).to have_current_path(category_expenses_path(@c1))
    end
  end
end
# rubocop:enable Metrics/BlockLength
