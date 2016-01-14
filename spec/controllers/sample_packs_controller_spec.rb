require 'rails_helper'

RSpec.describe SamplePacksController, type: :controller do
  describe "GET to sample_packs/:id" do
    before do
      @seller = Seller.create!(email: "email@email.com", password: "password", password_confirmation: "password")
      @sample_pack = SamplePack.create!(title: "sample pack 1", price: 4.99, file: File.open('features/upload-files/samplepack.zip'))
      @seller.sample_packs << @sample_pack

      get :show, id: @sample_pack.id
    end

    it "returns a 200 OK status code" do
      expect(response).to have_http_status :ok
    end

    it "loads the sample pack" do
      expect(assigns(:sample_pack).title).to eq "sample pack 1"
    end

    it "renders the show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET to sample_packs" do
    before do
      @seller = Seller.create!(email: "email@email.com", password: "password", password_confirmation: "password")
      @sample_pack = SamplePack.create!(title: "sample pack 1", price: 4.99, file: File.open('features/upload-files/samplepack.zip'))
      @sample_pack2 = SamplePack.create!(title: "sample pack 2", price: 4.99, file: File.open('features/upload-files/samplepack.zip'))
      @seller.sample_packs << @sample_pack
      @seller.sample_packs << @sample_pack2

      get :index
    end

    it "returns a 200 OK status code" do
      expect(response).to have_http_status :ok
    end

    it "loads the sample packs" do
      expect(assigns(:sample_packs).length).to eq 2
    end

    it "renders the index template" do
      expect(response).to render_template :index
    end
  end
end
