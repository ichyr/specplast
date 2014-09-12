class VmilistPolicy < ApplicationPolicy

  def new? 
    user.admin? || user.specialization.id = record.specialization.id
  end

  def create?
  	user.admin? || user.specialization.id = record.specialization.id
  end

  def edit?
  	user.admin? || user.specialization.id = record.specialization.id
  end

  def destroy?
  	user.admin? || user.specialization.id = record.specialization.id
  end
  
end

