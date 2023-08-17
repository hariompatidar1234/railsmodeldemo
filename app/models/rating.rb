class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :order
  validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end