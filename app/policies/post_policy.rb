class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user.following.pluck(:id) + [user.id])
    end
  end

  def index?
    true
  end

  def show?
    record.user == user || user.following.include?(record.user)
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def search?
    true
  end
end
