class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.is_a?(Viewer)
  end

  def destroy?
    user.is_a?(Viewer)
  end
end
