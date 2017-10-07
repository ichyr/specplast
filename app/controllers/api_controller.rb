class ApiController < ApplicationController
  before_filter :restrict_access
  before_action :set_default_response_format

  # api/vmilists/:id(.json) 
  def vmilist
    @vmilist = Vmilist
      .find(params[:id])

    respond_to do |format|
      format.json
    end
  end

  # api/vmilists?name=імя_вмілості(.json)
  # api/vmilists?rank=номер_рівня(.json)
  def vmilist_search
    @vmilists = Vmilist
      .where('lower("vmilists"."name") like ?', "%#{search_query}%")
      
    if search_level
      @vmilists = @vmilists.where('"vmilists"."level" = ?', "#{search_level}")
    end

    respond_to do |format|
      format.json
    end
  end

  # api/user/:email(.json)
  def user_achievements
    @registries = Registry
      .select(:vmilist_id)
      .where(email: search_email)
      .map(&:vmilist_id)
      .uniq 

    respond_to do |format|
      format.json { render json: @registries }
    end
  end


  def specialization_index
    @specializations = Specialization.includes(:vmilists)

    respond_to do |format|
      format.json
    end
  end

  def specialization
    @specialization = Specialization.includes(:vmilists).find(params[:id])
    
    respond_to do |format|
      format.json 
    end
  end

  protected
  
  def set_default_response_format
    request.format = :json unless params[:format]
  end


  private
  
  def restrict_access
    # authenticate_or_request_with_http_token do |token, options|
      # ApiKey.exists?(access_token: token)
    # end
    true
  end

  def search_query
    params["name"].mb_chars.downcase.to_s if params["name"]
  end

  def search_level
    params["level"].to_i if params["level"]
  end

  def search_email
    email = params[:email]
    if email
      email.include?('.json') ? email.split('.json')[0] : email      
    end
  end

end
