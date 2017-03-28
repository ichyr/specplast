class RegistryPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user.admin? if !user.nil?
  end

  def update?
    user.admin? if !user.nil?
  end

  def destroy?
    user.admin? if !user.nil?
  end

  def vmilist_instruktors?
    true
  end

  def autocomplete_vmilist_name?
    true
  end

  def autocomplete_instruktor_name?
    true
  end
end
