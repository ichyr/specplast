class UserPolicy < ApplicationPolicy

  def index?
    # noone should be abe to view list of users
    false if !user.nil?
  end

  def show?
    # everyone can see user profile
    true 
  end

  def edit?
    # only account owner should be able to edit account and admin
    puts "=====================================> Pundit"
    p user.id
    puts "=====================================> Pundit"
    p user.admin?
    puts "=====================================> Pundit"
    p record.id
    puts "=====================================> Pundit"
    ( user.id == record.id || user.admin? ) if !user.nil?
  end

  def update?
    # only account owner should be able to update account
    ( user.id == record.id || user.admin? ) if !user.nil?
  end

  def delete?
    # only account owner and admins should be able to update account
    ( user.id == record.id || user.admin? ) if !user.nil?
  end

end
