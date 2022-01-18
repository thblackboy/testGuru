class Admin::AnswersController < ApplicationController
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[create new]

  # GET /answers/1
  def show; end

  # GET /answers/new
  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit; end

  # POST /answers
  def create
    @answer = @question.answers.build(answer_params)
    if @answer.save
      redirect_to admin_answer_path(@answer)
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer)
    else
      render :edit
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to admin_question_path(@answer.question)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end
end
