class TrackPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new?
    user.is_a?(Viewer) && resource.stream.receiving_tracks? && user.tracks.where(stream_id: resource.stream.id).empty?
  end

  def create?
    user.is_a?(Viewer) && resource.stream.receiving_tracks?
  end

  def review?
    user.is_a? Admin
  end
end
