require 'rails_helper'

RSpec.describe SamplePack, type: :model do
  describe "relations" do
    before do
      @seller = Seller.create!(email: "email@email.com", password: "password", password_confirmation: "password")
      @sample_pack = SamplePack.new(title: "sample pack 1")
      @seller.sample_packs << @sample_pack
    end

    it "belongs to a seller" do
      expect(@sample_pack.seller).to eq @seller
      expect(@seller.sample_packs.length).to eq 1
      expect(@seller.sample_packs.first.title).to eq "sample pack 1"
    end
  end
end
