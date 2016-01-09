class SamplePack < ActiveRecord::Base

  belongs_to :seller

  mount_uploader :file, SamplePackUploader

end
