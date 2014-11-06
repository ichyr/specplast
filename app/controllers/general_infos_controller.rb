class GeneralInfosController < ApplicationController
  before_action :set_general_info, only: [:show, :edit, :update, :destroy]

  # GET /general_infos
  # GET /general_infos.json
  def index
    @general_infos = GeneralInfo.all
  end

  # GET /general_infos/1
  # GET /general_infos/1.json
  def show
  end

  # GET /general_infos/new
  def new
    @general_info = GeneralInfo.new
  end

  # GET /general_infos/1/edit
  def edit
  end

  # POST /general_infos
  # POST /general_infos.json
  def create
    @general_info = GeneralInfo.new(general_info_params)

    respond_to do |format|
      if @general_info.save
        format.html { redirect_to @general_info, notice: 'General info was successfully created.' }
        format.json { render :show, status: :created, location: @general_info }
      else
        format.html { render :new }
        format.json { render json: @general_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /general_infos/1
  # PATCH/PUT /general_infos/1.json
  def update
    respond_to do |format|
      if @general_info.update(general_info_params)
        format.html { redirect_to controller: :admin, action: :bulava, notice: 'Bulava was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /general_infos/1
  # DELETE /general_infos/1.json
  def destroy
    @general_info.destroy
    respond_to do |format|
      format.html { redirect_to general_infos_url, notice: 'Bulava info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_general_info
      @general_info = GeneralInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def general_info_params
      params.require(:general_info).permit(:key, :value)
    end
end
