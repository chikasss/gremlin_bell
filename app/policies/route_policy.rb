class RoutePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def save?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
