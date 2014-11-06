class AdminController < ApplicationController
  def index
  	@specializations = Specialization.all
  											.paginate(:page => params[:page], :per_page => 10)
  end

  def moderators
    @moderators = User.where("role = ?", 1)
                        .paginate(:page => params[:page], :per_page => 10)
  end

  def administrators
    @admins = User.where("role = ?", 2)
                        .paginate(:page => params[:page], :per_page => 10)
  end

  def instruktors
  	@instruktors = User.where("role = ?", 0)
  	                    .paginate(:page => params[:page], :per_page => 10)
  end

  def bulava
  	@bulava_info = GeneralInfo.where("key = ?", "bulava")
  end

end
