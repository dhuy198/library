class Book < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :genre, dependent: :destroy
  has_many :borrowing_items
  has_many :ratings
  has_many :users, through: :ratings

  accepts_nested_attributes_for :author, allow_destroy: :true
  accepts_nested_attributes_for :genre, allow_destroy: :true
  
  scope :active, -> { where(delete_flag: false) }

end

