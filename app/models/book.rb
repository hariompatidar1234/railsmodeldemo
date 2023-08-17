class Book < ApplicationRecord
  belongs_to :admin
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :ratings, dependent: :destroy

  validates :author, :price, :quantity, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :bookname , presence: true , uniqueness: {scope: :bookname ,message: "Book name is already Exist..!"}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 0}

  after_create :notify_mod
  before_validation :unique_title

	def notify_mod
	  puts "Information saved successfully..!"
	end
  def unique_title
  	self.author=self.author.downcase.strip!
  	self.title=self.title.downcase.strip!
    existing_book = Book.find_by("LOWER(title) = ?", title.downcase)

    if existing_book && existing_book != self
      errors.add(:title, "is already taken")
    end
  end
end

