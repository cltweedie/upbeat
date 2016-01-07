class Sound < ActiveRecord::Base
  mount_uploader :file, SoundUploader

  acts_as_votable

  belongs_to :producer
  belongs_to :instrument
  belongs_to :category
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true
  validates :file, presence: true

  after_save :create_waveform_image

  def create_tags(tags)
    tags.split(",").each do |tag|
      self.tags << Tag.find_or_create_by(name: tag.strip)
    end
  end

  def self.tagged_as(tag)
    Sound.joins(:tags).where("tags.name = ?", tag)
  end

  def self.filter_by_instrument(instrument_name)
    instrument = Instrument.find_by(name: instrument_name)
    Sound.where(instrument: instrument)
  end

  def self.filter_by_category(category_name)
    category = Category.find_by(name: category_name)
    Sound.where(category: category)
  end

  def net_votes
    self.get_upvotes.size - self.get_downvotes.size
  end

  def self.load_sounds(params)
    if params[:producer_id]
      @sounds = Producer.find(params[:producer_id]).sounds
    elsif params[:tag]
      @sounds = Sound.tagged_as(params[:tag])
    elsif params[:instrument]
      @sounds = Sound.filter_by_instrument(params[:instrument])
    elsif params[:category]
      @sounds = Sound.filter_by_category(params[:category])
    else
      @sounds = Sound.all
    end
    @sounds.order(cached_votes_score: :desc)
  end

  private
  def create_waveform_image
    Waveform.generate(self.file.path, "#{self.file.path}.png", force: true, background_color: "#0d0d0d")
  end
end
