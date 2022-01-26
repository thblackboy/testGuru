class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]
  before_action :test_over?, only: %i[show update]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.successful?
        TestsMailer.completed_test(@test_passage).deliver_now
        BadgeGiveService.new(@test_passage).call
      end
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def test_over?
    if @test_passage.end_time < Time.current
      redirect_to result_test_passage_path(@test_passage), alert: 'Тест завершен'
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
