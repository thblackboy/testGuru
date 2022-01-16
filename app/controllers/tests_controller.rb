class TestsController < ApplicationController

  before_action :find_user, only: %i[create start show]
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :check_author, only: %i[update edit destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def start
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = @user.tests_by_authors.build(test_params)
    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def check_author
    redirect_to tests_path, alert: "You don't have access" unless @test.author?(current_user)
  end

  def find_user
    @user = User.find(current_user.id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
