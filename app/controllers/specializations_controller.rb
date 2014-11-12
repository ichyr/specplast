class SpecializationsController < ApplicationController
  before_action :set_specialization, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  after_action :verify_authorized, :except => [:index, :show]

  # GET /specializations
  # GET /specializations.json
  def index
    # @specializations = Specialization.all
    redirect_to :root
  end

  # GET /specializations/1
  # GET /specializations/1.json
  def show
    @specialization = Specialization.find(params[:id])
    @vmilists = Vmilist.where('vmilists.name LIKE ? and vmilists.specialization_id = ?', 
      "%#{params[:search]}%", "#{params[:id]}").paginate per_page: 9, page: params[:page]
  end

  # GET /specializations/new
  def new
    @specialization = Specialization.new
    authorize @specialization
  end

  # GET /specializations/1/edit
  def edit
    @specialization = Specialization.find(params[:id])
    @specialization.specdatum

    authorize @specialization
  end

  # POST /specializations
  # POST /specializations.json
  def create
    @specialization = Specialization.new(specialization_params)

    authorize @specialization

    respond_to do |format|
      if @specialization.save
        format.html { redirect_to @specialization, notice: 'Specialization was successfully created.' }
        format.json { render :show, status: :created, location: @specialization }
      else
        format.html { render :new }
        format.json { render json: @specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specializations/1
  # PATCH/PUT /specializations/1.json
  def update
    authorize @specialization

    respond_to do |format|
      if @specialization.update(specialization_update_params)
        format.html { redirect_to @specialization, notice: 'Specialization was successfully updated.' }
        format.json { render :show, status: :ok, location: @specialization }
      else
        format.html { render :edit }
        format.json { render json: @specialization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specializations/1
  # DELETE /specializations/1.json
  def destroy
    authorize @specialization

    @specialization.destroy
    respond_to do |format|
      format.html { redirect_to specializations_url, notice: 'Specialization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialization
      @specialization = Specialization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialization_params
      params.require(:specialization).permit(:name, :avatar)
    end

    def specialization_update_params
    params.require(:specialization).permit( :name, :avatar, 
             specdatum_attributes: [:id, :gen_info, :proby, 
            :activity, :provid, :specialization_id, :file,
            :bootsy_image_gallery_id] )
  end
end
