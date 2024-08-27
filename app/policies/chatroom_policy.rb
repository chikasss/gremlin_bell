class ChatroomPolicy < ApplicationPolicy
  def show?
    user.present? && (record.user == user || record.recipient == user)
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def index?
    true
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user: user).or(scope.where(recipient: user))
      end
    end
  end
end
