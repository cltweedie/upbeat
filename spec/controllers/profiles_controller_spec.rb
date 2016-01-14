require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  describe "GET to producers/:id/profile" do
      before do
        @producer = Producer.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")
        @producer.profile.username = "username1"
        @producer.profile.save

        get :show, producer_id: @producer.id
      end

      it "returns a 200 OK status code" do
        expect(response).to have_http_status :ok
      end

      it "loads the profile" do
        expect(assigns(:profile).username).to eq "username1"
      end

      it "renders the show template" do
        expect(response).to render_template :show
      end
    end
end
