class ModeratorController < ApplicationController
  def index
    authorize :moderator, :index?
    
    @vmilists = Vmilist.select(:id, :avatar, :name).where("specialization_id = ? and name like ?", 
                        current_user.specialization_id, "%#{params[:search]}%")
                       .paginate(:page => params[:page], :per_page => 10)
  end

  def waiting
    @state_selected = NEEDS_APPROVE
    qualification_select

    respond_to do |format|
      format.html
      format.js { render action: "qualifications.js.erb" }
    end
  end

  def approved
    @state_selected = APPROVED
    qualification_select

    respond_to do |format|
      format.html
      format.js { render action: "qualifications.js.erb" }
    end
  end  

  def noinfo
    @state_selected = NO_INFORMATION
    qualification_select

    respond_to do |format|
      format.html
      format.js { render action: "qualifications.js.erb" }
    end
  end

  # params[:id]     - qualification id
  # params[:state]  - new state status
  # http://stackoverflow.com/questions/5380300/rails-checkbox-ajax-call-dont-
  # want-to-render-anything
  def change_qualification
    authorize :moderator, :index?

    temp = Qualification.find(params[:id])
    temp.set_confirmed params[:new_state]
    
    if temp.save
      render nothing: true, status: 200
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  def delete_qualification
    authorize :moderator, :index?

    temp = Qualification.find(params[:id])
    
    if temp.destroy
      render nothing: true, status: 200
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private
  def qualification_select
    authorize :moderator, :index?

    spec_vmilist_ids = current_user.specialization.vmilist_ids

    @qualifications = Qualification.joins(:user)
                      .where("vmilist_id in (?) and confirmed = ? and users.name like ?",
                        spec_vmilist_ids, @state_selected, "%#{params[:search]}%")
                      .paginate(:page => params[:page], :per_page => 10)
  end
end
