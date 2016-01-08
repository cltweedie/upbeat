class SoundsController < ApplicationController

  before_filter :load_sound, only: [ :show, :vote, :destroy, :edit, :update, :download ]

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
    @next_page = params[:page] ? params[:page].to_i + 1 : 2
    @sounds = Sound.load_sounds(params).paginate(page: params[:page])
    @pages = @sounds.length / Sound.per_page
    if params[:producer_id]
      @producer = Producer.find(params[:producer_id])
      render :producer_sounds
    end
  end

  def destroy
    @sound.destroy!
    render nothing: :true
  end

  def edit
    @instrument_options = Instrument.select_options
    @category_options = Category.select_options
  end

  def update
    @sound.update(sound_params)
    @sound.tags.clear
    @sound.create_tags(params[:tags])
    flash[:notice] = "Sound updated."
    redirect_to sound_path(@sound)
  end

  def vote
    current_producer.vote(sound: @sound, v: params[:v])
    render json: @sound.net_votes
  end

  def download
    if current_producer
      send_file(@sound.file.path, type: "audio/wav")
    else
      flash[:alert] = "You must be logged in to do that!"
    end
  end

  private
  def sound_params
    params.require(:sound).permit(:title, :file, :instrument_id, :category_id)
  end

  def load_sound
    @sound = Sound.find(params[:id])
  end
end
