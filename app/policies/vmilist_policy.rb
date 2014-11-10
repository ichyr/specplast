class VmilistPolicy < ApplicationPolicy

  def new? 
    ( user.admin? || user.specialization.id == record.specialization.id ) if !user.nil?
  end

  def create?
  	( user.admin? || user.specialization.id == record.specialization.id ) if !user.nil?
  end

  def edit?
  	( user.admin? || user.specialization.id == record.specialization.id ) if !user.nil?
  end

  def update?
    ( user.admin? || user.specialization.id == record.specialization.id ) if !user.nil?
  end

  def destroy?
  	( user.admin? || user.specialization.id == record.specialization.id ) if !user.nil?
  end
  
end

