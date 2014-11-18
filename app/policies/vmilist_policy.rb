class VmilistPolicy < ApplicationPolicy

  def new?
    user.admin? || user.moderator?
  end

  def create?
    puts "=================== Pundit ================"
    puts "user.admin? => #{user.admin?}"
    puts "=================== Pundit ================"
    puts "user.specialization_id => #{user.specialization_id}"
    puts "=================== Pundit ================"
    puts "record.specialization_id => #{record.specialization_id}"
    puts "=================== Pundit ================"
    if !user.nil? && !user.instruktor?
      user.admin? || user.specialization.id == record.specialization_id
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

