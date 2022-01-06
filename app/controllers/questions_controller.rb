class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    # render inline: 'Test: <%= @test.title %>. Questions: <%= @test.questions.ids %>'
    render inline: '<%= @test.questions.inspect %>'
  end

  def show
    render plain: @question.inspect
    # render inline: "Информация о вопросе: Вопрос: <%= @question.body %>\n
    # Варианты ответов: <%= @question.answers.pluck(:body) %>"
  end

  def new
  
  end

  def create
    @test.questions.create!(question_params)
    render plain: 'Вопрос успешно создан'
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос успешно удален'
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
    render plain: 'Вопрос не найден'
  end
end
