# frozen_string_literal: true

class StreamsController < ApplicationController
  include Pagy::Backend
  Pagy::DEFAULT[:items] = 8

  before_action :set_stream, only: %i[show edit update destroy]
  before_action :authenticate_admin!, except: %i[index show]

  # GET /streams or /streams.json
  def index
    @streams = Stream.all.order(:created_at).includes(:samples)
    authorize @streams
    @pagy, @streams = pagy(@streams)
  end

  # GET /streams/1 or /streams/1.json
  def show
    authorize @stream
    @new_stream_track = @stream.tracks.build
    @tracks = current_admin ? @stream.tracks.order('created_at desc').includes(:viewer) : @stream.tracks.order('created_at desc').includes(:viewer).where(reviewed: true)
    @tracks = @tracks.reorder('likes_count desc') if params['sortByLikes'] == 'true'
    @current_viewer_liked_tracks = viewer_signed_in? ? current_viewer.liked_tracks.ids : []
    @pagy, @tracks = pagy(@tracks)
  end

  # GET /streams/new
  def new
    @stream = Stream.new
    authorize @stream
  end

  # GET /streams/1/edit
  def edit
    authorize @stream
  end

  # POST /streams or /streams.json
  def create
    @stream = Stream.new(stream_params)
    @stream.admin = current_admin
    authorize @stream
    respond_to do |format|
      if @stream.save
        format.html { redirect_to @stream, notice: "Stream was successfully created." }
        format.json { render :show, status: :created, location: @stream }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /streams/1 or /streams/1.json
  def update
    authorize @stream
    respond_to do |format|
      if @stream.update(stream_params)
        format.html { redirect_to @stream, notice: "Stream was successfully updated." }
        format.json { render :show, status: :ok, location: @stream }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /streams/1 or /streams/1.json
  def destroy
    authorize @stream
    @stream.destroy
    respond_to do |format|
      format.html { redirect_to streams_url, notice: "Stream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stream
    @stream = Stream.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def stream_params
    params.require(:stream).permit(:title, :aired_at, :receiving_tracks)
  end

end
