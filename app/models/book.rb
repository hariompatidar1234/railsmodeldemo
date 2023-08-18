class Book < ApplicationRecord
  belongs_to :admin
  has_many :orders
  has_many :ratings, dependent: :destroy

  validates :author, :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :bookname , presence: true , uniqueness: {case_sensitive: false}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  after_create :notify_mod
  before_validation :unique_title

	def notify_mod
	  puts "Information saved successfully..!"
	end
  def unique_title
  	self.author=self.author.downcase.strip
  	self.bookname=self.bookname.downcase.strip
    
  end
end

