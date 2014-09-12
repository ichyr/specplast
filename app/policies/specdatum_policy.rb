class SpecdatumPolicy < ApplicationPolicy

  def new? 
    user.admin?
  end

  def create?
  	user.admin?
  end

  def edit?
  	user.admin? || user.specialization.id = record.specialization.id
  end

  def destroy?
  	user.admin?
  end
  
end

