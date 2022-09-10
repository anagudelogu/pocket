FactoryBot.define do
  factory :user, aliases: [:author] do
    name { 'John Doe' }
    password { '123456' }
    sequence :email do |n|
      "test#{n}@example.com"
    end
  end
end
