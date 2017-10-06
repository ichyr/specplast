class ApiController < ApplicationController
  before_filter :restrict_access

  # api/vmilists/:id(.json) 
  def vmilist
    @vmilist = Vmilist.find(params[:id])

    respond_to do |format|
      format.json
    end
  end

  # api/vmilists?name=імя_вмілості(.json)
  # api/vmilists?rank=номер_рівня(.json)
  def vmilist_search
    @vmilists = Vmilist.where('lower("name") like ?', "%#{search_query}%")
    .where('"level" like ?', "%#{search_level}%")
  end

  # api/user/:email(.json)
  def user_achievements

  end


  def specialization_index

  end

  def specialization

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
    params["search"]["level"].mb_chars.downcase.to_s if params["search"] && params["search"]["level"]
  end

end
