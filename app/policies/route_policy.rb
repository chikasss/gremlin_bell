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

  def unsave?
    true
  end

  def search?
    true 
  end

  def edit?
    update?
  end

  def update?
    user.present? && (user == record.user || user.admin?)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
