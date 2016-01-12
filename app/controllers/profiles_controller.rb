class ProfilesController < ApplicationController

  before_filter :load_profile, only: [ :show, :edit, :update ]

  def update
    Profile.update(@profile.id, profile_params)
    flash[:notice] = "Your profile has been updated."
    redirect_to producer_profile_path(@profile.producer)
  end

  def show
    if @profile.producer.provider == "soundcloud"
      client = Soundcloud.new(:client_id => 'df5cf1ba47848ed2b170135cdb6907b5')
      @username = @profile.producer.email.split('@')[0]
      @tracks = client.get("/users/#{@username}/tracks", :limit => 10, :order => 'hotness')
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:username, :bio, :avatar)
  end

  def load_profile
    @profile = Profile.find_by(producer_id: params[:producer_id])
  end

end
