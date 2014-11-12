class VmilistPolicy < ApplicationPolicy

  def new? 
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end

  def create?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end

  def edit?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end

  def update?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end

  def destroy?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end
  
end

