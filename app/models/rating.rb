class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :star, presence: true, inclusion: { in: 1..5 }

end
