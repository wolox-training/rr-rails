class ApiPolicy < ApplicationPolicy
  def index?
    user_has_access?
  end

  def show?
    user_has_access?
  end

  def create?
    user_has_access?
  end

  def update?
    user_has_access?
  end

  def destroy?
    admin?
  end

  def user_has_access?
    admin? || belongs_to_user?
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      return scope.all if user.admin?
      scope.where user_id: user.id
    end
  end
end
