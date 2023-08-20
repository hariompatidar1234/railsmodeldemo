class User < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy
  validates :first_name, :last_name, :contact, :address, presence: true
  validates :first_name, :last_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :contact, format: { with: /\A\d{10}\z/, message: "should be 10 digits" }
  validates :address, format: { with: /\A[\w\s]+\z/, message: "only allows letters, digits, and spaces" }
  before_save :normalize_name
  validate :unique_name

  private

  def normalize_name
    self.first_name = self.first_name.strip.downcase
    self.last_name = self.last_name.strip.downcase
    self.address = self.address.strip.downcase

  end

  def unique_name
    if first_name == last_name
      errors.add(:base, "First name and last name cannot be the same")
    end
  end
  
end
