require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

  describe '#total_amount' do
    it 'should return the total amount of all expenses under the category' do
      e1 = create(:expense, amount: 15, author: category.user)
      e2 = create(:expense, amount: 10, author: category.user)
      e3 = create(:expense, amount: 5, author: category.user)

      category.expenses << [e1, e2, e3]
      total_amount = category.total_amount

      expect(total_amount).to eq 30
    end

    it 'should return 0 if there are no expenses' do
      total_amount = category.total_amount
      expect(total_amount).to eq 0
    end
  end

  describe 'validations' do
    context 'A valid Category' do
      it 'should have name' do
        category.name = nil
        expect(category).not_to be_valid
      end

      it 'should have an icon' do
        category.icon = nil
        expect(category).not_to be_valid
      end
    end
  end
end
