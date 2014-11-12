class GeneralInfoPolicy < ApplicationPolicy
  def index?
    user.admin? if !user.nil?
  end

  def show?
    user.admin? if !user.nil?
  end

  def new? 
    user.admin? if !user.nil?
  end

  def create?
    user.admin? if !user.nil?
  end

  def edit?
    user.admin? if !user.nil?
  end

  def update?
    user.admin? if !user.nil?
  end

  def destroy?
    user.admin? if !user.nil?
  end
end