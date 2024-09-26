class TestsController < ApplicationController
  before_action :find_test, only: %i[start]

  def index
    @tests = Test.joins(:questions)
      .group("tests.id")
      .having("COUNT(questions.id) > 0")
  end

  def start
    current_user.tests.push(@test)

    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
