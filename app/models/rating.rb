class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :book
  validates :rate, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment,presence: true 
 before_save :normalize_name
  

  private

  def normalize_name
    self.comment = self.comment.strip.downcase
  end
end
