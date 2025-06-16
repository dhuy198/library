class Book < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :genre, dependent: :destroy
  has_many :borrowing_items
  has_many :ratings
  has_many :users, through: :ratings

  accepts_nested_attributes_for :author, allow_destroy: :true
  accepts_nested_attributes_for :genre, allow_destroy: :true
  
  has_one_attached :featured_image

  scope :active, -> { where(delete_flag: false) }
  
  validates :title, presence: true
  validates :author_id, presence: true, unless: -> { author.present? }
  validates :genre_id, presence: true, unless: -> { genre.present? }
  validates :publishing_year, numericality: { only_integer: true }, allow_nil: true
  validates :quantity_in_stock, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end

