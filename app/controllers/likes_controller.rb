class LikesController < ApplicationController

  before_action :authenticate_viewer!
  before_action :set_track

  def create
    @like = Like.new(track: @track, viewer: current_viewer)
    authorize @like

    @like.save
  end

  def destroy
    authorize @like

    @like.destroy
  end

  private

  def set_track
    @track = Track.find(params[:track_id])
  end
end
