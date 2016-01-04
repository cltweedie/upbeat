class Welcome < ApplicationMailer

  def welcome_email(user)
    mail(to: user.email, subject: "Welcome")
  end

end
