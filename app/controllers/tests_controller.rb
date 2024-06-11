class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit]

  def index
    @tests = Test.all
  end

  def show; end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end
