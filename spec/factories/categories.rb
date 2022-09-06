FactoryBot.define do
  factory :category do
    user
    name { 'MyCategory' }
    icon { 'https://via.placeholder.com/150x150/cccccc/969696?text=Not+Available' }
  end
end
