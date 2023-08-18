class Admin < ApplicationRecord
  has_many :books
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :gmail, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validate :unique_name
  def unique_name
    if first_name == last_name
      errors.add(:base, "First name and last name cannot be the same")
    end
  end
end
