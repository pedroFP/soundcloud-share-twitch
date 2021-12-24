# frozen_string_literal: true

class StreamPolicy < ApplicationPolicy
  attr_reader :session, :stream

  def initialize(session, stream)
    @session = session
    @stream = stream
  end

  def new?
    session.is_a?(Admin)
  end

  def create?
    session.is_a?(Admin)
  end

  def show?
    session.is_a?(Viewer) || session.is_a?(Admin)
  end

  def edit?
    session.is_a?(Admin)
  end

  def update?
    session.is_a?(Admin)
  end

  def destroy?
    session.is_a?(Admin)
  end

 
  class Scope < Scope
    def resolve
      return scope if session.is_a?(Viewer) || session.is_a?(Admin)
    end
  end
end
