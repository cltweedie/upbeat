require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe "buying a pack as a producer" do
    before do
      @sample_pack = SamplePack.new(title: "sample pack 1")
      @producer = Producer.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")
      @producer.purchased_packs << @sample_pack
    end

    it "keeps track of whether a sample pack has been purchased by a producer" do
      expect(@producer.purchased_packs.length).to eq 1
      expect(@producer.purchased_packs.first.title).to eq "sample pack 1"

      expect(@sample_pack.buyers.length).to eq 1
    end
  end

  describe "buying a pack as a seller" do
    before do
      @sample_pack = SamplePack.new(title: "sample pack 1")
      @seller = Seller.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")
      @seller.purchased_packs << @sample_pack
    end

    it "keeps track of whether a sample pack has been purchased by a seller" do
      expect(@seller.purchased_packs.length).to eq 1
      expect(@seller.purchased_packs.first.title).to eq "sample pack 1"

      expect(@sample_pack.buyers.length).to eq 1
    end
  end
end
