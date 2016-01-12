class SamplePack < ActiveRecord::Base

  belongs_to :seller

  has_many :purchases
  has_many :buyers, through: :purchases, source: :producer

  mount_uploader :file, SamplePackUploader
  mount_uploader :cover_image, SamplePackImageUploader

end
