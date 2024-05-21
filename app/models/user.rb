class User < ApplicationRecord
  has_many :tests_statuses
  has_many :tests, through: :tests_statuses
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    tests.where(level: level)
  end
end
