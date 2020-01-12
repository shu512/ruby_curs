class QuestionsController < ApplicationController
  def edit
    @discipline = Discipline.find(params[:id])
    @question = @discipline.questions.find(params[:discipline_id])
  end

  def create
    @discipline = Discipline.find(params[:discipline_id])
    @question = @discipline.questions.create(question_params)
    authorize @question
    redirect_to discipline_path(@discipline)
  end

  def update
    @discipline = Discipline.find(params[:discipline_id])
    @question = @discipline.questions.find(params[:id])
    authorize @question
    if @question.update(question_params)
      redirect_to @discipline
    else
      render 'edit'
    end
  end

  def destroy
    @discipline = Discipline.find(params[:discipline_id])
    @question = @discipline.questions.find(params[:id])
    authorize @question
    @question.destroy

    redirect_to discipline_path(@discipline)
  end

  private

  def question_params
    params.require(:question).permit(:content)
  end
end
