# frozen_string_literal: true

class Scope < ApplicationPolicy
  attr_reader :session, :scope

  def initialize(session, scope)
    @session = session
    @scope = scope
  end
end