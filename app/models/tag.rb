class Tag < ActiveRecord::Base

  has_many :taggings
  has_many :sounds, through: :taggings

end
