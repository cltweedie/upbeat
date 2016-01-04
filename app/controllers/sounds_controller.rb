class SoundsController < ApplicationController

  def new
    @sound = Sound.new
  end

  def create
    @sound = Sound.new(sound_params)
    @sound.producer = current_producer
    @sound.save
    redirect_to root_path
  end

  def show
    @sound = Sound.find(params[:id])
  end

  private
  def sound_params
    params.require(:sound).permit(:title, :file)
  end

end
