class LikesController < ApplicationController

  before_action :authenticate_viewer!
  before_action :set_track

  def create
    @like = Like.new(track: @track, viewer: current_viewer)
    authorize @like
    @track.create_likes current_viewer, track: @track, viewer: current_viewer
    set_current_viewer_liked_tracks
  end

  def destroy
    @like = Like.find_by(track: @track, viewer: current_viewer)
    authorize @like

    @track.destroy_likes_from current_viewer
    set_current_viewer_liked_tracks
  end

  private

  def set_track
    @track = Track.find(params[:track_id])
  end

  def set_current_viewer_liked_tracks
    @current_viewer_liked_tracks = current_viewer.liked_tracks.ids
  end
end
