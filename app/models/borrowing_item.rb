class BorrowingItem < ApplicationRecord
  belongs_to :borrowing
  belongs_to :book
  
  validate :valid_quantity
  
  private
  def valid_quantity
    if quantity.nil? || quantity <= 0
      errors.add(:quantity, "phải lớn hơn 0")
    elsif book && quantity > book.quantity_in_stock
      errors.add(:quantity, "vượt quá số lượng sách hiện có")
    end
  end
end
