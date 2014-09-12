class SpecializationPolicy < ApplicationPolicy

  def new? 
    user.admin?
  end

  def create?
  	user.admin?
  end

  def edit?
  	user.admin? || user.specialization.id == record.id
  end

  def destroy?
  	user.admin?
  end
  
end

