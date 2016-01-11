class Producer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:soundcloud]

  acts_as_voter

  has_many :sounds

  after_create :send_welcome_email

  def vote(sound: 1, v: "up")
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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.email = "#{auth.info.nickname}@soundcloud.com"
      user.password = Devise.friendly_token[0,20]
    end
  end

  def self.new_with_session(params, session)
      super.tap do |producer|
        if data = session["devise.soundcloud_data"] && session["devise.soundcloud_data"]["extra"]["raw_info"]
          producer.email = data["email"] if producer.email.blank?
        end
      end
    end

  private
  def send_welcome_email
    Welcome.welcome_email(self).deliver_now
  end
end
