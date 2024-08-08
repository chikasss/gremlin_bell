class CommentPolicy < ApplicationPolicy
  def create?
    user.present? && (record.user == user || user.admin?)
  end

  def show?
    true
  end

  def edit?
    user.present? && (record.user == user || user.admin?)
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end
end