class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  has_one :rating, dependent: :destroy
  validates :quantity, numericality: { only_integer: true }
  after_save :update_book_quantity

  def update_book_quantity 
    new_book_quantity=book.quantity-quantity
    book.update(quantity: new_book_quantity)
  end 
end
