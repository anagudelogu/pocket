class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_and_belongs_to_many :categories

  validates :name, :amount, presence: true
end
