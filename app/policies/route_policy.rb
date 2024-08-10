class RoutePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def new?
    true
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
