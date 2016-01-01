class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @registries = Registry.all
    respond_with(@registries)
  end

  def show
    respond_with(@registry)
  end

  def new
    @registry = Registry.new
    respond_with(@registry)
  end

  def edit
  end

  def create
    @registry = Registry.new(registry_params)
    @registry.save
    respond_with(@registry)
  end

  def update
    @registry.update(registry_params)
    respond_with(@registry)
  end

  def destroy
    @registry.destroy
    respond_with(@registry)
  end

  def vmilist_instruktors
    @instruktors = Qualification
    .joins(:user)
    .where("vmilist_id = CAST(? AS INT)", params[:vmilist_id])
    .select("users.id", "users.name")
    .limit(10)
    
    respond_to do |format|
      format.json { render :json => @instruktors }
    end
  end

  private
    def set_registry
      @registry = Registry.find(params[:id])
    end

    def registry_params
      params.require(:registry).permit(:name, :surname, :dob, :sex, :rank_id, :troop, :group, :city, :region, :vmilist_id, :achievement_date, :place, :activity, :instruktor_id, :comment)
    end
end
