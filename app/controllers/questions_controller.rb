class QuestionsController < ApplicationController
  def edit
    @discipline = Discipline.find(params[:id])
    @question = @discipline.questions.find(params[:discipline_id])
  end

  def create
    @discipline = Discipline.find(params[:discipline_id])
    @question = @discipline.questions.create(question_params)
    redirect_to discipline_path(@discipline)
  end

  def destroy
    @discipline = Discipline.find(params[:discipline_id])
    @question = @discipline.questions.find(params[:id])
    @question.destroy

    redirect_to discipline_path(@discipline)
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
