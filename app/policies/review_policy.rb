class ReviewPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user.present? && (record.user == user || user.admin?)
  end

  def destroy?
    user.present? && (record.user == user || user.admin?)
  end

end
