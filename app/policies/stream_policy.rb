# frozen_string_literal: true

class StreamPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      return scope if @session.is_a?(Viewer) || @session.is_a?(Admin)
    end
  end

  attr_reader :session, :stream

  def initialize(session, stream)
    @session = session
    @stream = stream
  end

  def index?
    true
  end

  def new?
    session.is_a?(Admin)
  end

  def create?
    session.is_a?(Admin)
  end

  def show?
    true
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
end
