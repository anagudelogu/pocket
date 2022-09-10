require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'Validations' do
    let(:expense) { create(:expense) }

    context 'a valid expense' do
      it 'should have a name' do
        expense.name = nil
        expect(expense).not_to be_valid
      end

      it 'should have an amount' do
        expense.amount = nil
        expect(expense).not_to be_valid
      end
    end
  end
end
