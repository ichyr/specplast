class UserPolicy < ApplicationPolicy

  def index?
    # noone should be able to view list of users
    false if !user.nil?
  end

  def show?
    # everyone can see user profile
    true 
  end

  def edit?
    # only account owner should be able to edit account and admin
    ( user.admin? || user.id == record.id ) if !user.nil?
  end

  def update?
    # only account owner should be able to update account and admin

    puts "=====================================> Pundit"
    puts "=====================================> UPDATING USER"
    p user.id
    puts "=====================================> Pundit"
    p user.admin?
    puts "=====================================> Pundit"
    p record.id
    puts "=====================================> Pundit"
    p "Policy said that => #{( user.admin? || user.id == record.id ) if !user.nil?}"
    puts "=====================================> Pundit"
    ( user.admin? || user.id == record.id ) if !user.nil?
  end

  def delete?
    # only account owner and admins should be able to update account and admin
    ( user.admin? || user.id == record.id ) if !user.nil?
  end

end
