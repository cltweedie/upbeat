class Sound < ActiveRecord::Base

  belongs_to :producer

  validates :title, presence: true

end
