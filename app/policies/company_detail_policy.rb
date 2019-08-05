class CompanyDetailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def index?
    is_admin?
  end

  def show?
    is_admin?
  end

  def create?
    true
  end

  def update?
    is_admin?
  end

  def destroy?
    is_admin?
  end
end
