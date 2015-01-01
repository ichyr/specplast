class ModeratorController < ApplicationController
  def index
    authorize :moderator, :index?
    
    @vmilists = Vmilist.where("specialization_id = ? and name like ?", 
                        current_user.specialization_id, "%#{params[:search]}%")
                       .paginate(:page => params[:page], :per_page => 10)
  end

  def waiting
    qualification_select NEEDS_APPROVE
  end

  def approved
    qualification_select APPROVED    
  end  

  def noinfo
    qualification_select NO_INFORMATION
  end

  # params[:id]     - qualification id
  # params[:state]  - new state status
  # http://stackoverflow.com/questions/5380300/rails-checkbox-ajax-call-dont-
  # want-to-render-anything
  def change_qualification
    temp = Qualification.find(params[:id])
    temp.change_status params[:new_state]
    temp.save

    render nothing: true
  end

  private
  def qualification_select state
    authorize :moderator, :index?

    spec_vmilist_ids = current_user.specialization.vmilist_ids

    @qualifications = Qualification.where("vmilist_id in (?) and 
                        confirmed = ?", spec_vmilist_ids, state)
                      .paginate(:page => params[:page], :per_page => 10)
  end
end
