class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    authorize Registry
    @registries = Registry.all
    respond_with(@registries)
  end

  def show
    authorize Registry
    respond_with(@registry)
  end

  def new
    authorize Registry
    @registry = Registry.new
    respond_with(@registry)
  end

  def edit
    authorize Registry
  end

  def create
    authorize Registry
    @registry = Registry.new(registry_params)
    @registry.save
    respond_with(@registry)
  end

  def update
    authorize Registry
    @registry.update(registry_params)
    respond_with(@registry)
  end

  def destroy
    authorize Registry
    @registry.destroy
    respond_with(@registry)
  end

  def vmilist_instruktors
    authorize Registry
    @instruktors = Qualification
    .joins(:user)
    .where("vmilist_id = CAST(? AS INT) and \"users\".\"name\" like ?", params[:vmilist_id], "%#{params[:q]}%")
    .select("users.id", "users.name")
    .limit(10)

    respond_to do |format|
      format.json { render :json => @instruktors }
    end
  end

  def autocomplete_vmilist_name
    authorize Registry
    params[:q] = params[:q] || ''
    @vmilists = Vmilist.where("name like ?", "%#{params[:q]}%")
    .limit(10)

    respond_to do |format|
      format.json { render :json => @vmilists.map{|v| [v.id.to_s, v.name.to_s]} }
    end
  end

  def autocomplete_instruktor_name
    authorize Registry
    params[:q] = params[:q] || ''
    params[:vmilist_id] = params[:vmilist_id] || ''

    @instruktors = Qualification
    .joins(:user)
    .where("vmilist_id = CAST(? AS INT) and \"users\".\"name\" like ?", params[:vmilist_id], "%#{params[:q]}%")
    .select("users.id", "users.name")
    .limit(10)

    puts params[:q]
    puts params[:vmilist_id]

    respond_to do |format|
      format.json { render :json => @instruktors.map{|v| [v.id.to_s, v.name.to_s]} }
    end
  end

  private
  def set_registry
    @registry = Registry.find(params[:id])
  end

  def registry_params
    params.require(:registry).permit(:name, :surname, :dob, :sex, :rank_id, :troop, :group, :city, :region, :vmilist_id, :achievement_date, :place, :activity, :instruktor_id, :comment, :photo_url)
  end
end
