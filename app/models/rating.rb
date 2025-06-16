class Rating < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validate :check

  def check
    
    if star.nil? 
      errors.add(:base, "Hãy điền đánh giá")
     
    elsif star > 5 || star < 1
      puts "RUNNING CHECK 6 "  
      errors.add(:base, "Đánh giá trong khoảng 1 đến 5 sao")
     
    end
  end

end
