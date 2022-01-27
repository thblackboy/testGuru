class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show result update]

  def show
    redirect_to result_test_passage_path(@test_passage) if @test_passage.completed?
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      if @test_passage.successful?
        TestsMailer.completed_test(@test_passage).deliver_now
        BadgeService::BadgeGiveService.new(@test_passage).call
      end
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
