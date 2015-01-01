class ModeratorController < ApplicationController
  def index
    authorize :moderator, :index?
    
    @vmilists = Vmilist.where("specialization_id = ? and name like ?", 
                        current_user.specialization_id, "%#{params[:search]}%")
                       .paginate(:page => params[:page], :per_page => 10)
  end

  def waiting
    authorize :moderator, :index?

    spec_vmilist_ids = current_user.specialization.vmilist_ids

    @qualifications = Qualification.where("vmilist_id in (?) and confirmed = false",
                                          spec_vmilist_ids)
                    .paginate(:page => params[:page], :per_page => 10)
    
  end

  def approved
    authorize :moderator, :index?

    spec_vmilist_ids = current_user.specialization.vmilist_ids

    @qualifications = Qualification.where("vmilist_id in (?) and confirmed = true",
                                          spec_vmilist_ids)
                    .paginate(:page => params[:page], :per_page => 10)
    
  end  

  def noinfo
    authorize :moderator, :index?

    spec_vmilist_ids = current_user.specialization.vmilist_ids

    @qualifications = Qualification.where("vmilist_id in (?) and confirmed = null",
                                          spec_vmilist_ids)
                    .paginate(:page => params[:page], :per_page => 10)
    
  end

  # params[:id]     - qualification id
  # params[:state]  - new state status
  # http://stackoverflow.com/questions/5380300/rails-checkbox-ajax-call-dont-want-to-render-anything
  def change_qualification
    temp = Qualification.find(params[:id])
    temp.change_status params[:new_state]
    render nothing: true
  end
end
