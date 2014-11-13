class UsersController < ApplicationController

  after_action :verify_authorized

  def index
    authorize :users, :index?

    @instruktors = User.where("role = ?", 0)
    @moderators = User.where("role = ?", 1)
    @admins = User.where("role = ?", 2)
  end

  def show
    authorize :users, :show?

    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

    authorize @user
  end

  def update
    @user = User.find(params[:id])
    
    authorize @user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to action: "index", 
                                  notice: 'User was successfully updated.' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, 
                             status: :unprocessable_entity }
      end
    end
  end

  def delete
    @user = User.find(params[:id])

    authorize @user

    @user.destroy
    redirect_to request.referrer || root_path, notice: 'User was successfully destroyed.'
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :role, :specialization_id, :avatar)
    end
end
