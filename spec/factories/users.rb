FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    password { '123456' }
    sequence :email do |n|
      "test#{n}@example.com"
    end
  end
end
