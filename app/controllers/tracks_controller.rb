class TracksController < ApplicationController
  include Pagy::Backend
  Pagy::DEFAULT[:items] = 10

  before_action :authenticate_viewer!, except: %i[index show]
  before_action :set_track, only: %i[show destroy]
  before_action :set_stream, except: %i[index show]


  def index
    @tracks = Track.all.joins(:viewer)
    @tracks = @tracks.where(viewers: { subscriber: params['sortBySub'] }) if params['sortBySub'] == 'true'
    @pagy, @tracks = pagy(@tracks)
  end

  def show; end

  def new
    @track = @stream.tracks.build
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

  def set_stream
    @stream = Stream.find(params[:stream_id])
  end

  def track_params
    params.require(:track).permit(:soundcloud_url, :stream_id, :viewer_id)
  end

end
