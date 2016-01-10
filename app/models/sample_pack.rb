class SamplePack < ActiveRecord::Base

  belongs_to :seller

  mount_uploader :file, SamplePackUploader
  mount_uploader :cover_image, SamplePackImageUploader

end
