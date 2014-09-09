class SpecdataController < ApplicationController
  before_action :set_specdatum, only: [:show, :edit, :update, :destroy]

  # GET /specdata
  # GET /specdata.json
  def index
    @specdata = Specdatum.all
  end

  # GET /specdata/1
  # GET /specdata/1.json
  def show
  end

  # GET /specdata/new
  def new
    @specdatum = Specdatum.new
  end

  # GET /specdata/1/edit
  def edit
  end

  # POST /specdata
  # POST /specdata.json
  def create
    @specdatum = Specdatum.new(specdatum_params)

    respond_to do |format|
      if @specdatum.save
        format.html { redirect_to @specdatum, notice: 'Specdatum was successfully created.' }
        format.json { render :show, status: :created, location: @specdatum }
      else
        format.html { render :new }
        format.json { render json: @specdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specdata/1
  # PATCH/PUT /specdata/1.json
  def update
    respond_to do |format|
      if @specdatum.update(specdatum_params)
        format.html { redirect_to @specdatum, notice: 'Specdatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @specdatum }
      else
        format.html { render :edit }
        format.json { render json: @specdatum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specdata/1
  # DELETE /specdata/1.json
  def destroy
    @specdatum.destroy
    respond_to do |format|
      format.html { redirect_to specdata_url, notice: 'Specdatum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specdatum
      @specdatum = Specdatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specdatum_params
      params.require(:specdatum).permit(:gen_info, :proby, :activity, :provid, :specialization_id)
    end
end
