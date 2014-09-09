class SpecializationPolicy < ApplicationPolicy

  def new? 
    user.admin?
  end

  def create?
  	user.admin?
  end

	# 
  #  TODO check for correct moderator
  # 
  #  user.admin? || (user.moderator? && user.specialization.id = record.id)
  # 
  def edit?
  	user.admin?
  end

  def destroy?
  	user.admin?
  end
  
end

