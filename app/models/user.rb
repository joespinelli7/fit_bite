class User < ApplicationRecord
  has_many :user_foods
  has_many :foods, through: :user_foods
  accepts_nested_attributes_for :foods
  before_save { self.email = email.downcase }

  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def full_name
    self.first_name + " " + self.last_name
  end
end
