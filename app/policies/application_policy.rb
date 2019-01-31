# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.has_role? 'admin'
  end

  def show?
    @user.has_role? 'admin'
  end

  def create?
    user.has_role? 'admin'
  end

  def new?
    create?
  end

  def update?
    user.has_role? 'admin'
  end

  def edit?
    user.has_role? 'admin'
  end

  def destroy?
    user.has_role? 'admin'
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
