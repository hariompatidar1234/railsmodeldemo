class Admin < ApplicationRecord
  has_many :books
  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :gmail, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_save :normalize_name
  validate :unique_name

  private

  def normalize_name
    self.first_name = self.first_name.strip.downcase
    self.last_name = self.last_name.strip.downcase
  end

  def unique_name
    if first_name == last_name
      errors.add(:base, "First name and last name cannot be the same")
    end
  end
end
