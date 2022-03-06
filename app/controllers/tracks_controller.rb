class TracksController < ApplicationController
  include Pagy::Backend
  Pagy::DEFAULT[:items] = 10

  before_action :authenticate_viewer!, except: %i[index show review]
  before_action :set_stream, except: %i[index show review]
  before_action :authenticate_admin!, only: %i[review]
  before_action :set_track, only: %i[review]
  before_action :authenticate_admin!, only: %i[review]
  after_action :verify_authorized, except: %i[review]

  def index
    @tracks = Track.all.includes(:viewer).order('tracks.created_at desc')
    authorize @tracks
    @tracks = @tracks.where(viewers: { subscriber: params['sortBySub'] }) if params['sortBySub'] == 'true'
    @tracks = @tracks.reorder('likes_count desc') if params['sortByLikes'] == 'true'
    @current_viewer_liked_tracks = viewer_signed_in? ? current_viewer.liked_tracks.ids : []
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
        format.html { redirect_to @track.stream, notice: "Track was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def review
    @track.update(reviewed: !@track.reviewed)
    respond_to do |format|
      format.js
    end
  end

  private

  def set_stream
    @stream = Stream.find(params[:stream_id])
  end

  def track_params
    params.require(:track).permit(:soundcloud_url, :stream_id, :viewer_id)
  end

  def set_track
    @track = Track.find(params[:id])
  end

end
