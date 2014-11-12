class ModeratorController < ApplicationController
  def index
  	authorize :moderator, :index?
  	
  	@vmilists = Vmilist.where("specialization_id = ? and name like ?", 
  											current_user.specialization_id, "%#{params[:search]}%")
  										 .paginate(:page => params[:page], :per_page => 10)
  end
end
