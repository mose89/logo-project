class SingleOrderNotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  def create?
    is_admin?
  end

  def update?
    is_admin?
  end

  def destroy?
    is_admin?
  end

end
