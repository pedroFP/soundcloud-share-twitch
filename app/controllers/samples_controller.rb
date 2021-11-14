class SamplesController < ApplicationController
  before_action :set_stream

  def index
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
  end

  def create
  end

  def new
  end

  private

  def set_stream
    @stream = Stream.find(params[:stream_id])
  end

end
