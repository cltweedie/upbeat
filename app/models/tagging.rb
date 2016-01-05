class Tagging < ActiveRecord::Base

  belongs_to :sound
  belongs_to :tag

end
