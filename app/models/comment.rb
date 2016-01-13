class Comment < ActiveRecord::Base

  belongs_to :producer
  belongs_to :sound

  validates :body, presence: true, length: { minimum: 5 }

end
