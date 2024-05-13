class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins('JOIN tests_statuses ON tests.id = tests_statuses.test_id').where(
      'tests_statuses.user_id = ? AND tests.level = ?', id, level
    )
  end
end
