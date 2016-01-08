class Producers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def soundcloud
      @producer = Producer.from_omniauth(request.env["omniauth.auth"])

      if @producer.persisted?
        sign_in_and_redirect @producer, :event => :authentication
        set_flash_message(:notice, :success, :kind => "Soundcloud") if is_navigational_format?
      else
        session["devise.soundcloud_data"] = request.env["omniauth.auth"]
        redirect_to new_producer_registration_url
      end
    end

    def failure
      redirect_to root_path
    end

end
