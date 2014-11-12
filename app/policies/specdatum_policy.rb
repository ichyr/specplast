class SpecdatumPolicy < ApplicationPolicy

  def new? 
    user.admin? if !user.nil?
  end

  def edit?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end

  def create?
    user.admin? if !user.nil?
  end

  def update?
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization_id == record.specialization_id
    end
  end

  def destroy?
    user.admin? if !user.nil?
  end
  
end

