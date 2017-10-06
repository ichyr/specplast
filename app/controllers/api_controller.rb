class ApiController < ApplicationController
  before_filter :restrict_access

  # api/vmilists/:id(.json) 
  def vmilist
    @vmilist = Vmilist
      .select(:id, :name, :child_info, :instructor_info, :specialization_id, :status, :level, :avatar)
      .find(params[:id])

    respond_to do |format|
      format.json { render json: @vmilist}
    end
  end

  # api/vmilists?name=імя_вмілості(.json)
  # api/vmilists?rank=номер_рівня(.json)
  def vmilist_search
    @vmilists = Vmilist
      .select(:id, :name, :child_info, :instructor_info, :specialization_id, :status, :level, :avatar)
      .where('lower("vmilists"."name") like ?', "%#{search_query}%")
      
    if search_level
      @vmilists = @vmilists.where('"vmilists"."level" = ?', "#{search_level}")
    end

    respond_to do |format|
      format.json { render json: @vmilists}
    end
  end

  # api/user/:email(.json)
  def user_achievements
    @registries = Registry.select(:vmilist_id).find(email: params[:email])

    respond_to do |format|
      format.json { render json: @vmilists}
    end
  end


  def specialization_index
    @specializations = Specialization.all.includes(:vmilists).join(:vmilists)

    respond_to do |format|
      format.json { render json: @specializations}
    end
  end

  def specialization
    @specialization = Specialization.find(params[:id]).includes(:vmilists).join(:vmilists)
    
    respond_to do |format|
      format.json { render json: @specialization}
    end
  end

  private
  
  def restrict_access
    # authenticate_or_request_with_http_token do |token, options|
      # ApiKey.exists?(access_token: token)
    # end
    true
  end

  def search_query
    params["search"]["name"].mb_chars.downcase.to_s if params["search"] && params["search"]["name"]
  end

  def search_level
    params["search"]["level"].to_i if params["search"] && params["search"]["level"]
  end

end
