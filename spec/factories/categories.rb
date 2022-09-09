FactoryBot.define do
  factory :category do
    user
    name { 'MyCategory' }
    icon { 'https://images.pexels.com/photos/461198/pexels-photo-461198.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' }
  end
end
