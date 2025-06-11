class Borrowing < ApplicationRecord
  belongs_to :user
  has_many :borrowing_items, dependent: :destroy
  has_many :books, through: :borrowing_items
  accepts_nested_attributes_for :borrowing_items, allow_destroy: true

  scope :active, -> {where(delete_flag: false)}
  after_create :decrease_book_quantity!

  private

  def decrease_book_quantity!
    borrowing_items.each do |item|
      book = item.book
      if book && item.quantity.present? && item.quantity > 0
        book.decrement!(:quantity_in_stock, item.quantity)
      end
    end
  end
end
