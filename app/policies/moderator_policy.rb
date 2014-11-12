class ModeratorPolicy < ApplicationPolicy
  def index?
    user.moderator? if !user.nil?
  end
end

