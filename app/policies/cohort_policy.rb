class CohortPolicy < ApplicationPolicy
  def index?
    user.has_role? "admin"
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end