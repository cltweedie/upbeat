class Sound < ActiveRecord::Base
  mount_uploader :file, SoundUploader

  belongs_to :producer
  belongs_to :instrument

  validates :title, presence: true
  validates :file, presence: true

  after_save :create_waveform_image

  private
  def create_waveform_image
    Waveform.generate(self.file.path, "#{self.file.path}.png", force: true)
  end

end
