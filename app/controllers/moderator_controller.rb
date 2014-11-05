class ModeratorController < ApplicationController
  def index
  	@vmilists = Vmilist.where("specialization_id = ?", current_user.specialization_id)
  										 .paginate(:page => params[:page], :per_page => 10)
  end

  def specialization
  	@specialization = Specialization.find(current_user.specialization.id)
  	@scpecializaion.specdata
  end
end
