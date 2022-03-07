class SamplesController < ApplicationController
  before_action :set_stream
  after_action :verify_authorized

  def destroy
    @sample = Sample.find(params[:id])
    authorize @sample
    @destroyed = @sample.destroy
  end

  def create
    @sample = Sample.new(sample_params)
    authorize @sample
    @saved = @sample.save
  end

  private

  def sample_params
    params.require(:sample).permit(:name, :link, :stream_id)
  end

  def set_stream
    @stream = Stream.find(params[:stream_id])
  end

end
