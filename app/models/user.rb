class User < ApplicationRecord
  has_many :user_foods
  has_many :foods, through: :user_foods
  has_many :user_activities
  has_many :activities, through: :user_activities

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

  def foods_attributes=(food_attributes)
    food_attributes.values.each do |food_attribute|
      food = Food.find_or_create_by(food_attribute)
      self.foods << food
    end
  end
end
