class UsersController < ApplicationController
  def index
    @admins = User.where("role = ?", 2)
    @moderators = User.where("role = ?", 1)
    @instruktors = User.where("role = ?", 3)
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end
end
