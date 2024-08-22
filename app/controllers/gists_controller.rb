class GistsController < ApplicationController
  before_action :find_test_passage, only: :create

  def create
    result = GitQuestionService.new(@test_passage.current_question).call

    flash_options = if result.success?
        Gist.create(url: result.html_url, user: current_user, question: @test_passage.current_question)
        { notice: result.html_url }
      else
        { alert: "failed" }
      end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:test_passage])
  end
end
