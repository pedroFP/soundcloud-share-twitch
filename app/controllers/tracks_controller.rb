class TracksController < ApplicationController
  before_action :set_track, only: %i[show destroy]
  
  def index
    @tracks = Track.all
  end

  def show; end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(track_params)
    @track.viewer = current_viewer
    respond_to do |format|
      if @track.save
        format.html { redirect_to tracks_path, notice: "Track was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy; end

  private

  def set_track
    @track = Track.find(params[:id])
  end

  def track_params
    params.require(:track).permit(:soundcloud_url)
  end

end
