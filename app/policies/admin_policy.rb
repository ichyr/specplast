class AdminPolicy < ApplicationPolicy

  def create? 
    user.admin?
  end
  
end

