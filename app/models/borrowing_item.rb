class BorrowingItem < ApplicationRecord
  belongs_to :borrowing
  belongs_to :book
  
  validate :valid_quantity
  
  def valid_quantity
    if quantity.nil? || quantity <= 0
      errors.add(:base, "Số lượng phải lớn hơn 0")
    elsif book && quantity > book.quantity_in_stock
      errors.add(:base, "Số lượng vượt quá số lượng sách hiện có")
    end
  end
end
