class SamplePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    user.is_a? Admin
  end

  def create?
    user.is_a? Admin
  end
end
