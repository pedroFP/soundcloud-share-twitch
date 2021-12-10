class TracksController < ApplicationController
  include Pagy::Backend
  Pagy::DEFAULT[:items] = 10

  before_action :authenticate_viewer!, except: %i[index show]
  before_action :set_stream, except: %i[index show]
  after_action :verify_authorized

  def index
    @tracks = Track.all.includes(:viewer).order('created_at desc')
    authorize @tracks
    @tracks = @tracks.where(viewers: { subscriber: params['sortBySub'] }) if params['sortBySub'] == 'true'
    @pagy, @tracks = pagy(@tracks)
  end

  def new
    @track = @stream.tracks.build
    authorize @track
  end

  def create
    @track = Track.new(track_params)
    authorize @track
    @track.viewer = current_viewer
    respond_to do |format|
      if @track.save
        format.html { redirect_to tracks_path, notice: "Track was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_stream
    @stream = Stream.find(params[:stream_id])
  end

  def track_params
    params.require(:track).permit(:soundcloud_url, :stream_id, :viewer_id)
  end

end
