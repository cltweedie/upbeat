class Profile < ActiveRecord::Base

  belongs_to :producer

  mount_uploader :avatar, AvatarUploader

end
