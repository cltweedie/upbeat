class Sound < ActiveRecord::Base
  mount_uploader :file, SoundUploader

  belongs_to :producer

  validates :title, presence: true

end
