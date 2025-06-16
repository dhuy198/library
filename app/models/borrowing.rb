class Borrowing < ApplicationRecord
  belongs_to :user
  has_many :borrowing_items, dependent: :destroy
  has_many :books, through: :borrowing_items
  accepts_nested_attributes_for :borrowing_items, allow_destroy: true

  scope :active, -> {where(delete_flag: false)}

  validates :user_id, presence: true
  validate :end_at_check
  validate :end_after_start
  validate :at_least_one_book

  after_create :decrease_book_quantity!

  def at_least_one_book
    if borrowing_items.blank? || borrowing_items.all? { |item| item.marked_for_destruction? || item.book_id.blank? }
      errors.add(:base, "Chưa có sách nào trong phiếu.")
    end
  end

  def end_at_check 
    errors.add(:base, "Vui lòng chọn ngày trả sách!") if end_at.nil?   
  end


  def end_after_start
    errors.add(:base, "Ngày trả phải sau ngày hôm nay") if start_at.present? && end_at.present? && end_at < start_at
  end
  

  private

  def decrease_book_quantity!
    borrowing_items.each do |item|
      book = item.book
      next if book.nil?

      if item&.quantity > 0
        book.decrement!(:quantity_in_stock, item.quantity)
      end
    end
  end
end
