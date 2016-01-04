class Sound < ActiveRecord::Base
  mount_uploader :file, SoundUploader

  belongs_to :producer

  validates :title, presence: true

  after_save :create_waveform_image

  private
  def create_waveform_image
    Waveform.generate(self.file.path, "#{self.file.path}.png")
  end

end
