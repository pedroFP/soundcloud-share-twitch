class LikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return false unless user.is_a?(Viewer)

    track_stream = resource.track.stream
    tracks_liked_by_the_viewer = track_stream.tracks.joins(:likes).where(likes: { viewer: user })
    tracks_liked_by_the_viewer.empty?
  end

  def destroy?
    false
  end
end
