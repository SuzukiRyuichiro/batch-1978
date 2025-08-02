class RestaurantPolicy < ApplicationPolicy
  # NOTE: Up to Pundit v2.3.1, the inheritance was declared as
  # `Scope < Scope` rather than `Scope < ApplicationPolicy::Scope`.
  # In most cases the behavior will be identical, but if updating existing
  # code, beware of possible changes to the ancestors:
  # https://gist.github.com/Burgestrand/4b4bc22f31c8a95c425fc0e30d7ef1f5

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      # Write the logic to filter what instances user can see
      # scope.where(user: user)

      # Write a logic that says
      # Normal user can see their own restaurants
      # Admin can see all the restaurants
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def show?
    # write the logic of who is allowed to see the restaurant
    true
  end

  def new?
    # Only admins can go to the new form
    user.admin?
  end

  def create?
    new?
  end

  def destroy?
    # Only creator of the restaurant can destroy
    # restaurant instance is stored in `record`
    # user instance is stored in `user`
    record.user == user
  end

  def edit?
    # Only creator of the restaurant can see the edit form
    record.user == user
  end

  def update?
    edit?
  end
end
