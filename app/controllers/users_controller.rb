class UsersController < ApplicationController

  after_action :verify_authorized

  def index
    authorize :users, :index?

    @instruktors = find_by_role 0
    @moderators = find_by_role 1
    @admins = find_by_role 2
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
        format.html { redirect_to form_route(@user.role), 
                                  notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
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
      params.require(:user).permit(:name, :email, :role,
                                   :specialization_id, :avatar, :vmilist_token,
                                   :city, :region, :description)
    end

    def form_route role
      roles = User.roles.keys

      case role
      when roles[0] then admin_instruktors_path
      when roles[1] then admin_moderators_path
      when roles[2] then admin_administrators_path
      else admin_path
      end

    end

    def find_by_role role_id
      User.select(:id, :name, :avatar, :email, :specialization_id)
          .where("role = ?", role_id)
    end
end
