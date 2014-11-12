class AdminPolicy < ApplicationPolicy
  def index?
    user.admin? if !user.nil?
  end

  def moderators?
    user.admin? if !user.nil?
  end

  def administrators?
    user.admin? if !user.nil?
  end

  def instruktors?
    user.admin? if !user.nil?
  end

  def bulava?
    user.admin? if !user.nil?
  end
end

