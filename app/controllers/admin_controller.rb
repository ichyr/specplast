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
  	@bulava = GeneralInfo.where("key = ?", "bulava")
  end

  def bulava_update
     respond_to do |format|
      if @specdatum.update(bulava_params)
        format.html { redirect_to @specdatum, notice: 'Specdatum was successfully updated.' }
        format.json { render :show, status: :ok, location: @specdatum }
      else
        format.html { render :edit }
        format.json { render json: @specdatum.errors, status: :unprocessable_entity }
      end
    end
  end
end
