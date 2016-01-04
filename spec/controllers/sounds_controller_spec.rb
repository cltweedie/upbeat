require 'rails_helper'

RSpec.describe SoundsController, type: :controller do
  describe "GET to sounds/:id" do
    before do
      @sound = Sound.create!(title: "Sound")

      get :show, id: @sound.id
    end

    it "returns a 200 OK status code" do
      expect(response).to have_http_status(:ok)
    end

    it "loads all of the sounds" do
      expect(assigns(:sound).title).to eq("Sound")
    end

    it "renders the index template" do
      expect(response).to render_template(:show)
    end
  end
end