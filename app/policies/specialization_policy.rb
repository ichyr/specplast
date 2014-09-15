class SpecializationPolicy < ApplicationPolicy

  def new? 
    user.admin? if !user.nil?
  end

  def create?
  	user.admin? if !user.nil?
  end

  def edit?
  	( user.admin? || user.specialization.id == record.id ) if !user.nil?
  end

  def destroy?
  	user.admin? if !user.nil?
  end
  
end

