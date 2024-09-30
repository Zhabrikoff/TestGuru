class Admin::TestsController < Admin::BaseController
  before_action :find_tests, only: %i[index update_inline]
  before_action :find_test, only: %i[show destroy update_inline update_status]

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to [:admin, @test]
    else
      render :new
    end
  end

  def destroy
    @test.destroy

    redirect_to admin_tests_path
  end

  def edit; end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def update_status
    if @test.update(status: !@test.status)
      flash[:notice] = "Status updated"
    else
      flash[:alert] = "Something went wrong"
    end
    redirect_to admin_tests_path
  end

  private

  def find_tests
    @tests = Test.all
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
