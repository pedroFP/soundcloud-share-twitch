class LikesController < ApplicationController

  before_action :authenticate_viewer!
  before_action :set_track

  def create
    @like = Like.new(track: @track, viewer: current_viewer)
    authorize @like
    @like.save
    @track.create_likes_for_subs current_viewer.subscriber?
    set_current_viewer_liked_tracks
  end

  def destroy
    @like = Like.find_by(track: @track, viewer: current_viewer)
    authorize @like

    @like.destroy
    @track.destroy_likes_for_subs current_viewer.subscriber?
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
