class Producer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  has_many :sounds

  after_create :send_welcome_email

  def vote(sound:, v:)
    if ( v == "up") && ( self.voted_down_on? sound )
      sound.undisliked_by self
    elsif v == "up"
      sound.upvote_from self
    elsif ( v == "down" ) && ( self.voted_up_on? sound )
      sound.unliked_by self
    elsif v == "down"
      sound.disliked_by self
    end
  end

  private
  def send_welcome_email
    Welcome.welcome_email(self).deliver_now
  end
end
