class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      flash_options = { notice: t('.success_html', gist_url: view_context.link_to(t('.gist_url_text'), result.gist_url, target: '_blank')) }
      Gist.create!(question: @test_passage.current_question, gist_url: result.gist_url, owner: current_user)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end
end
