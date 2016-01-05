class SoundsController < ApplicationController

  def new
    if current_producer
      @sound = Sound.new
    else
      flash[:alert] = "You must be logged in to do that!"
      redirect_to root_path
    end
  end

  def create
    @sound = Sound.new(sound_params)
    @sound.producer = current_producer
    @sound.save
    redirect_to sound_path(@sound)
  end

  def show
    @sound = Sound.find(params[:id])
  end

  def index
    @sounds = Sound.all
  end

  private
  def sound_params
    params.require(:sound).permit(:title, :file)
  end

end
