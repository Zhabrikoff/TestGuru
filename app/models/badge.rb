class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, :image, :rule_type, :rule_value, presence: true

  RULES = {
    "Passing all tests from the category" => :category_completed,
    "Passing the test on the first try" => :first_attempt,
    "Passing all tests of a certain level" => :level_completed,
  }.freeze
end
