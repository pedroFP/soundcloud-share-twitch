# frozen_string_literal: true

class StreamPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def new?
    user.is_a? Admin
  end

  def create?
    user.is_a? Admin
  end

  def show?
    true
  end

  def edit?
    user.is_a? Admin
  end

  def update?
    user.is_a? Admin
  end

  def destroy?
    user.is_a? Admin
  end
end
