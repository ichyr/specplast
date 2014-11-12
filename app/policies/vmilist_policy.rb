class VmilistPolicy < ApplicationPolicy

  def new? 
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization.id == record.specialization.id
    end
  end

  def create?
  	if !user.nil? && !user.instruktor?
      user.admin? || user.specialization.id == record.specialization.id
    end
  end

  def edit?
  	if !user.nil? && !user.instruktor?
      user.admin? || user.specialization.id == record.specialization.id
    end
  end

  def update?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization.id == record.specialization.id
    end
  end

  def destroy?
  	if !user.nil? && !user.instruktor?
      user.admin? || user.specialization.id == record.specialization.id
    end
  end
  
end

