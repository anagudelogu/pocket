require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'Validations' do
    it 'should have a Name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'should have an email' do
      user.email = nil
      expect(user).to_not be_valid
    end

    it 'should have a password' do
      user.password = nil
      expect(user).to_not be_valid
    end
  end
end
