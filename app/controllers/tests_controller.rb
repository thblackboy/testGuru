class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new; end

  def create
    @test = Test.build(test_params)
    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    render plain: 'Вопрос успешно удален'
  end


end
