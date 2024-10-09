class BadgeService
  def initialize(user, test_passage)
    @badges = []
    @user = user
    @test_passage = test_passage
  end

  def call
    Badge.all.each do |badge|
      @badges << badge if send("make_sure_#{badge.rule_type}?", badge)
    end

    @user.badges << @badges if @badges.present?
  end

  private

  def make_sure_first_attempt?(badge)
    @user.test_passages.where(test_id: @test_passage.test_id).count == 1 && @test_passage.successful?
  end

  def make_sure_category_completed?(badge)
    category = Category.find_by(title: badge.rule_value)

    return unless category

    tests_ids = category.tests.where(status: true).ids
    passed_tests_ids = @user.test_passages
      .where(test_id: tests_ids, successful: true)
      .pluck(:test_id)
      .uniq

    tests_ids.sort == passed_tests_ids.sort
  end

  def make_sure_level_completed?(badge)
    test_level = badge.rule_value.to_i
    tests_by_level = Test.where(level: test_level, status: true).ids
    passed_tests_by_level = @user.test_passages
      .where(test_id: tests_by_level, successful: true)
      .pluck(:test_id)
      .uniq

    tests_by_level.sort == passed_tests_by_level.sort
  end
end
