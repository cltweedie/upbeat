class SoundsController < ApplicationController

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

  def show
    @sound = Sound.find(params[:id])
  end

  def index
    if params[:tag]
      @sounds = Sound.tagged_as(params[:tag])
    elsif params[:instrument]
      @sounds = Sound.filter_by_instrument(params[:instrument])
    elsif params[:category]
      @sounds = Sound.filter_by_category(params[:category])
    else
      @sounds = Sound.all
    end
  end

  def vote
    @sound = Sound.find(params[:id])
    if ( params[:v] == "up") && ( current_producer.voted_down_on? @sound )
      @sound.undisliked_by current_producer
    elsif params[:v] == "up"
      @sound.upvote_from current_producer
    elsif ( params[:v] == "down" ) && ( current_producer.voted_up_on? @sound )
      @sound.unliked_by current_producer
    elsif params[:v] == "down"
      @sound.disliked_by current_producer
    end
    render json: @sound.net_votes
  end

  private
  def sound_params
    params.require(:sound).permit(:title, :file, :instrument_id, :category_id)
  end
end
