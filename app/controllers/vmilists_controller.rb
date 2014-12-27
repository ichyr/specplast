class VmilistsController < ApplicationController
  before_action :set_vmilist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]

  after_action :verify_authorized, :except => [:index, :show, :preview]

  # GET /vmilists
  # GET /vmilists.json
  def index
    @vmilists = Vmilist.paginate(:page => params[:page], :per_page => 10)
  end

  # GET /vmilists/1
  # GET /vmilists/1.json
  def show
    @instruktors = Vmilist.find(params[:id]).users.where("name like ?", "%#{params[:search]}%")
  end

  # GET /vmilists/new
  def new
    @vmilist = Vmilist.new

    authorize @vmilist
  end

  # GET /vmilists/1/edit
  def edit
    authorize @vmilist
  end

  # POST /vmilists
  # POST /vmilists.json
  def create
    @vmilist = Vmilist.new(vmilist_params)

    authorize @vmilist

    respond_to do |format|
      if @vmilist.save
        format.html {  redirect_to moderator_path, notice: 'Vmilist was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /vmilists/1
  # PATCH/PUT /vmilists/1.json
  def update
    authorize(@vmilist)

    respond_to do |format|
      if @vmilist.update(vmilist_params)
        format.html { redirect_to moderator_path, notice: 'Vmilist was successfully update.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /vmilists/1
  # DELETE /vmilists/1.json
  def destroy
    authorize @vmilist

    @vmilist.destroy
    respond_to do |format|
      format.html { redirect_to :back , notice: 'Vmilist was successfully destroyed.' }
    end
  end

  def preview
    @vmilists = Vmilist.where("name like ?", "%#{params[:q]}%").select(:id, :name).limit(10)
    respond_to do |format|
      format.json { render :json => @vmilists.map(&:attributes) }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vmilist
      @vmilist = Vmilist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vmilist_params
      params.require(:vmilist).permit(:name, :avatar, :child_info, :instructor_info, 
                                      :specialization_id, :users)
    end
end
