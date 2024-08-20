class TestPassagesController < ApplicationController
  before_action :find_test_passage, only: %i[show result update gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GitQuestionService.new(@test_passage.current_question).call

    flash_options = if result
        current_user.gists.create!(question: @test_passage.current_question, url: result)
        { notice: result }
      else
        { alert: "failed" }
      end

    redirect_to @test_passage, flash_options
  end

  private

  def find_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
