class ProfilesController < ApplicationController

  before_filter :load_profile, only: [ :show, :edit, :update ]

  def update
    Profile.update(@profile, profile_params)
    flash[:notice] = "Your profile has been updated."
    redirect_to producer_profile_path(@profile.producer)
  end

  private
  def profile_params
    params.require(:profile).permit(:username, :bio)
  end

  def load_profile
    @profile = Profile.find_by(producer_id: params[:producer_id])
  end

end
