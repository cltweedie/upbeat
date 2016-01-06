class Sound < ActiveRecord::Base
  mount_uploader :file, SoundUploader

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

  private
  def create_waveform_image
    Waveform.generate(self.file.path, "#{self.file.path}.png", force: true)
  end
end
