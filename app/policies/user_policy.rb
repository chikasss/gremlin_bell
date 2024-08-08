class UserPolicy < ApplicationPolicy

  def edit?
    true
  end

  def update?
    true
    record == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
