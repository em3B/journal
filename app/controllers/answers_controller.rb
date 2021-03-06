class AnswersController < ApplicationController
  before_action :find_answer, only: %i[show update]

  def show
  end

  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    if @answer.save
      # flash[:notice] = "Answer saved!"
      redirect_to entry_path(params[:answer][:entry_id].to_i), notice: "Answer saved!"
    else
      render :new
    end
  end

  def update
    @answer = Answer.find(params[:id])
    @answer.update(answer_params)
    redirect_to entry_path(params[:answer][:entry_id])
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end

end
