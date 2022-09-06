require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }

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
