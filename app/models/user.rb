class User < ApplicationRecord
  has_many :user_foods
  has_many :foods, through: :user_foods

  def full_name
    self.first_name + " " + self.last_name
  end
end
