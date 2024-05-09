class Test < ApplicationRecord
  def self.sorting_tests_by_category(category_name)
    Test.joins('JOIN categories ON tests.category_id = categories.id')
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
  end
end
