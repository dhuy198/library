class Book < ApplicationRecord
  belongs_to :author, optional: :destroy
  belongs_to :genre, optional: :destroy
  has_many :borrowing_items
  has_many :ratings
  has_many :users, through: :ratings

  accepts_nested_attributes_for :author, allow_destroy: :true
  accepts_nested_attributes_for :genre, allow_destroy: :true

  def author_attributes=(attributes)
    self.author = Author.find_or_create_by(name: attributes[:name]) if attributes[:name].present?
  end

  def genre_attributes=(attributes)
    self.genre = Genre.find_or_create_by(name: attributes[:name]) if attributes[:name].present?
  end
  
  has_one_attached :featured_image

  scope :active, -> { where(delete_flag: false) }
  
  validates :author_id, presence: true, unless: -> { author.present? }
  validates :genre_id, presence: true, unless: -> { genre.present? }
  # validates :publishing_year, numericality: { only_integer: true }, allow_nil: true
  # validates :quantity_in_stock, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validate :v_title
  validate :v_subtitle
  validate :v_publishing
  validate :v_quantity
  validate :v_description
  
  def v_title 
    errors.add(:base, "Tiêu đề không được bỏ trống") if title.nil? 
  end
  def v_subtitle 
    errors.add(:base, "Phụ đề không được bỏ trống") if subtitle.nil? 
  end
  def v_publishing 
    errors.add(:base, "Năm xuất bản không được bỏ trống") if publishing_year.nil? 
  end
  def v_quantity 
    errors.add(:base, "Số lượng không được bỏ trống") if quantity_in_stock.nil? 
  end
  def v_description 
    errors.add(:base, "Mô tả không được bỏ trống") if description.nil? 
  end
end

