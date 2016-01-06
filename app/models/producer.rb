class Producer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter

  has_many :sounds

  after_create :send_welcome_email

  private
  def send_welcome_email
    Welcome.welcome_email(self).deliver_now
  end
end
