FactoryBot.define do
  factory :expense do
    user
    name { 'Expense' }
    amount { 1.5 }
  end
end
