FactoryBot.define do
  factory :expense do
    author
    name { 'Expense' }
    amount { 1.5 }
  end
end
