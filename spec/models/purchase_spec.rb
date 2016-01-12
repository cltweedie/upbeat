require 'rails_helper'

RSpec.describe Purchase, type: :model do
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
  end
end
