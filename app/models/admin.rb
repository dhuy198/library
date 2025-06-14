class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email,
            presence: { message: "không được để trống" },
            format:   { with: URI::MailTo::EMAIL_REGEXP, message: "không đúng định dạng" },
            uniqueness: { case_sensitive: false, message: "đã được sử dụng" }
end
