require 'rails_helper'

RSpec.describe SamplePack, type: :model do
  describe "associations" do
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

  describe "validations" do
    context "without a title" do
      before do
        @sample_pack = SamplePack.create(price: 4.99, file: File.open('features/upload-files/samplepack.zip'))
      end

      it "is not valid" do
        expect(@sample_pack).not_to be_valid
      end
    end

    context "without a price" do
      before do
        @sample_pack = SamplePack.create(title: "Pack 1", file: File.open('features/upload-files/samplepack.zip'))
      end

      it "is not valid" do
        expect(@sample_pack).not_to be_valid
      end
    end

    context "without a file" do
      before do
        @sample_pack = SamplePack.create(title: "Pack 1", price: 4.99)
      end

      it "is not valid" do
        expect(@sample_pack).not_to be_valid
      end
    end
  end
end
