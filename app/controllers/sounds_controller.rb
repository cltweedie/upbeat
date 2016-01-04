class SoundsController < ApplicationController

  def new
    @sound = Sound.new
  end

  def create
    @sound = Sound.new(sound_params)
    @sound.producer = current_producer
    Waveform.generate(@sound.file.path, "#{@sound.file.path}.png", force: true)
    @sound.save
    redirect_to sound_path(@sound)
  end

  def show
    @sound = Sound.find(params[:id])
  end

  private
  def sound_params
    params.require(:sound).permit(:title, :file)
  end

end
