require 'rails_helper'

RSpec.describe SoundsController, type: :controller do
  describe "GET to sounds/:id" do
    before do
      @sound = Sound.new(title: "Sound")
      @sound.file = File.open("spec/support/test.wav")
      @sound.save!

      get :show, id: @sound.id
    end

    after do
      path = @sound.file.path.split("/")
      path.pop
      FileUtils.rm_rf(path.join("/"))
    end

    it "returns a 200 OK status code" do
      expect(response).to have_http_status(:ok)
    end

    it "loads the sound" do
      expect(assigns(:sound).title).to eq("Sound")
    end

    it "renders the show template" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET to sounds" do
    before do
      @sound = Sound.new(title: "Sound")
      @sound.file = File.open("spec/support/test.wav")
      @sound.save!

      @sound2 = Sound.new(title: "Sound2")
      @sound2.file = File.open("spec/support/test.wav")
      @sound2.save!

      get :index
    end

    after do
      path = @sound.file.path.split("/")
      path.pop
      FileUtils.rm_rf(path.join("/"))

      path = @sound2.file.path.split("/")
      path.pop
      FileUtils.rm_rf(path.join("/"))
    end

    it "returns a 200 OK status code" do
      expect(response).to have_http_status(:ok)
    end

    it "loads the sounds" do
      expect(assigns(:sounds).length).to eq(2)
      expect(assigns(:sounds).first.title).to eq("Sound")
    end

    it "renders the index template" do
      expect(response).to render_template(:index)
    end
  end
end
