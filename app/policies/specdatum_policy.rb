class SpecdatumPolicy < ApplicationPolicy

  def new? 
    user.admin? if !user.nil?
  end

  def edit?
    user.admin? || user.specialization.id == record.specialization.id if !user.nil?
  end

  def create?
    user.admin? if !user.nil?
  end

  def update?
    user.admin? if !user.nil?
  end

  def destroy?
    user.admin? if !user.nil?
  end
  
end

