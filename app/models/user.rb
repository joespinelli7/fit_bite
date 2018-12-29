class User < ApplicationRecord
  has_many :user_foods
  has_many :foods, through: :user_foods
  has_secure_password

  validates :email, presence: true, uniqueness: true

  def full_name
    self.first_name + " " + self.last_name
  end
end
