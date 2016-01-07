class SoundsController < ApplicationController

  before_filter :load_sound, only: [ :show, :vote ]

  def new
    if current_producer
      @sound = Sound.new
      @instrument_options = Instrument.select_options
      @category_options = Category.select_options
    else
      flash[:alert] = "You must be logged in to do that!"
      redirect_to root_path
    end
  end

  def create
    @sound = Sound.new(sound_params)
    @sound.producer = current_producer
    @sound.create_tags(params[:tags])
    @sound.save
    redirect_to sound_path(@sound)
  end

  def index
    @sounds = Sound.load_sounds(params)
  end

  def vote
    current_producer.vote(sound: @sound, v: params[:v])
    render json: @sound.net_votes
  end

  private
  def sound_params
    params.require(:sound).permit(:title, :file, :instrument_id, :category_id)
  end

  def load_sound
    @sound = Sound.find(params[:id])
  end
end
