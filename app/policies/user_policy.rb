class UserPolicy < ApplicationPolicy
  def edit?
    true
  end

  def update?
    true
  end

  def index?
    true
  end

  def saved_trips?
    record == user
  end

  def created_routes?
    true
  end

  def created_reviews?
    true
  end

  def show?
    true
  end

  def user_reviews?
    true
  end

  def follow?
    user != record
  end

  def unfollow?
    user.following.include?(record)
  end

  def followers? 
    true
  end

  def following?
    true
  end

  def search?
    true 
  end

  class Scope < Scope
    def resolve
      scope.all
    end

  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5



    class Scope < ApplicationPolicy::Scope
      # NOTE: Be explicit about which records you allow access to!
      # def resolve
      #   scope.all
      # end
    end
  end
end
