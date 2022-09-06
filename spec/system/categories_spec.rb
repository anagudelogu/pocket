require 'rails_helper'

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

    scenario 'Clicking on new category takes me to a form to create a category' do
      click_on text: /new category/i

      expect(page).to have_current_path(new_category_path)
      expect(page).to have_selector('form', id: 'new-category')
    end

    # PENDING: clicking on a category should lead lo Transactions#index
    # PENDING: Should show the total amount of all transactions for that
    #          category
  end
end
