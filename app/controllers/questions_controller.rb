class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.map(&:body)
  end

  def show
    render plain: @question.body
  end

  def new; end

  def create
    new_question = @test.questions.new(question_params)

    if new_question.save
      render plain: "Question: '#{new_question.body}' has been created!"
    else
      render plain: "Question was not created: #{new_question.errors.full_messages}"
    end
  end

  def destroy
    @question.destroy

    render plain: 'The question has been deleted!'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found!'
  end
end
