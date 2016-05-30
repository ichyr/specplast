class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    authorize :registry, :index?
    @registries = Registry.all
    respond_with(@registries)
  end

  def show
    authorize :registry, :show?
    respond_with(@registry)
  end

  def new
    authorize :registry, :new?
    @registry = Registry.new
    respond_with(@registry)
  end

  def edit
    authorize :registry, :edit?
  end

  def create
    authorize :registry, :create?
    @registry = Registry.new(registry_params)
    @registry.save
    respond_with(@registry)
  end

  def update
    authorize :registry, :update?
    @registry.update(registry_params)
    respond_with(@registry)
  end

  def destroy
    authorize :registry, :destroy?
    @registry.destroy
    respond_with(@registry)
  end

  def vmilist_instruktors
    authorize :registry, :vmilist_instruktors?
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
    authorize :registry, :autocomplete_vmilist_name?
    params[:q] = params[:q] || ''
    @vmilists = Vmilist.where("name like ?", "%#{params[:q]}%")
    .limit(10)

    respond_to do |format|
      format.json { render :json => @vmilists.map{|v| [v.id.to_s, v.name.to_s]} }
    end
  end

  def autocomplete_instruktor_name
    authorize :registry, :autocomplete_instruktor_name?
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
    params.require(:registry).permit(:name, :surname, :dob, :sex, :rank_id, :troop, :group, :city, :region, :vmilist_id, :achievement_date, :place, :activity, :instruktor_id, :comment)
  end
end
