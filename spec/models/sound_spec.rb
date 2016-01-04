require 'rails_helper'

RSpec.describe Sound, type: :model do
  before do
    @sound = Sound.create!(title: "Sound1")
    @producer = Producer.create!

    @producer.sounds << @sound
  end

  it "belongs to a producer" do
    expect(@producer.sounds.length).to eq 1
    expect(@producer.sounds.first.title).to eq "Sound1"
  end
end
