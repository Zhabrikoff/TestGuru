class User < ApplicationRecord
  has_many :tests_statuses
  has_many :tests, through: :tests_statuses
  has_many :author_tests, class_name: 'Test', foreign_key: :author_id

  def tests_by_level(level)
    Test.joins('JOIN tests_statuses ON tests.id = tests_statuses.test_id').where(
      'tests_statuses.user_id = ? AND tests.level = ?', id, level
    )
  end
end
