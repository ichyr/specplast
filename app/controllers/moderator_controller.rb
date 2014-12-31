class ModeratorController < ApplicationController
  def index
    authorize :moderator, :index?
    
    @vmilists = Vmilist.where("specialization_id = ? and name like ?", 
                        current_user.specialization_id, "%#{params[:search]}%")
                       .paginate(:page => params[:page], :per_page => 10)
  end

  def qualification
    authorize :moderator, :index?

    spec_vmilist_ids = current_user.specialization.vmilist_ids

    @qualifications = Qualification.where("vmilist_id in (?) and confirmed = false",
                                          spec_vmilist_ids)
                    .paginate(:page => params[:page], :per_page => 10)
    
  end
end
