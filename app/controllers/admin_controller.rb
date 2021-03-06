class AdminController < ApplicationController
  after_action :verify_authorized

  def index
    authorize :admin, :index?

  	@specializations = Specialization.select(:name, :avatar, :id, :status).all
  											.paginate(:page => params[:page], :per_page => 10)
  end

  def moderators
    authorize :admin, :moderators?

    @moderators = User.select(:id, :name, :avatar, :email, :specialization_id)
                      .where("role = ?", 1)
                      .paginate(:page => params[:page], :per_page => 10)
  end

  def administrators
    authorize :admin, :administrators?

    @admins = User.select(:id, :name, :avatar, :email, :specialization_id)
                  .where("role = ?", 2)
                  .paginate(:page => params[:page], :per_page => 10)
  end

  def instruktors
    authorize :admin, :instruktors?

  	@instruktors = User.select(:id, :name, :avatar, :email, :specialization_id)
                       .where("role = ?", 0)
  	                   .paginate(:page => params[:page], :per_page => 10)
  end

  def bulava
    authorize :admin, :bulava?
    
  	@bulava_info = GeneralInfo.where("key = ?", "bulava")
  end

  def administrator_contacts
    authorize :admin, :administrator_contacts?
    
    @information = GeneralInfo.where("key = ?", "administration")
  end

end
