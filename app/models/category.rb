class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :expenses

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    expenses.map(&:amount).reduce(:+) || 0
  end
end
