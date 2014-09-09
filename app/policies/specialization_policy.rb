class SpecializationPolicy < ApplicationPolicy

  def new? 
    user.admin?
  end
  
end

