class ExamlistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_examlist, only: [:show, :edit, :update, :destroy]

  # GET /examlists
  # GET /examlists.json
  def index
    @examlists = Examlist.all
  end

  # GET /examlists/1
  # GET /examlists/1.json
  def show
  end

  # GET /examlists/new
  def new
    @examlist = Examlist.new
  end

  # GET /examlists/1/edit
  def edit
  end

  # POST /examlists
  # POST /examlists.json
  def create
    @examlist = Examlist.new(examlist_params)
    authorize @examlist
    respond_to do |format|
      if @examlist.save
        format.html { redirect_to @examlist, notice: 'Examlist was successfully created.' }
        format.json { render :show, status: :created, location: @examlist }
      else
        format.html { render :new }
        format.json { render json: @examlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examlists/1
  # PATCH/PUT /examlists/1.json
  def update
    authorize @examlist
    respond_to do |format|
      if @examlist.update(examlist_params)
        format.html { redirect_to @examlist, notice: 'Examlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @examlist }
      else
        format.html { render :edit }
        format.json { render json: @examlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examlists/1
  # DELETE /examlists/1.json
  def destroy
    authorize @examlist
    @examlist.destroy
    respond_to do |format|
      format.html { redirect_to examlists_url, notice: 'Examlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_examlist
      @examlist = Examlist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def examlist_params
      params.require(:examlist).permit(:student_id, :examination_id, :mark)
    end
end
