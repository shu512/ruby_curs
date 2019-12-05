class ExaminationsController < ApplicationController
  def index
    @examinations = Examination.all
  end

  def show
    @examination = Examination.find(params[:id])
  end

  def new
    @examination = Examination.new
  end

  def edit
    @examination = Examination.find(params[:id])
  end

  def create
    @examination = Examination.new(examination_params)

    if @examination.save
      redirect_to @examination
    else
      render 'new'
    end
  end

  def update
    @examination = Examination.find(params[:id])

    if @examination.update(examination_params)
      redirect_to @examination
    else
      render 'edit'
    end
  end

  def destroy
    @examination = Examination.find(params[:id])
    @examination.destroy

    redirect_to examinations_path
  end

  private

  def examination_params
    params.require(:examination).permit(:date, :group_id, :discipline_id)
  end
end
