require 'rails_helper'

RSpec.describe Sound, type: :model do
  describe "relations" do
    before do
      @sound = Sound.new(title: "Sound1")
      @sound.file = File.open("spec/support/test.wav")
      @sound.save!

      @producer = Producer.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")

      @producer.sounds << @sound
    end

    after do
      path = @sound.file.path.split("/")
      path.pop
      FileUtils.rm_rf(path.join("/"))
    end

    it "belongs to a producer" do
      expect(@producer.sounds.length).to eq 1
      expect(@producer.sounds.first.title).to eq "Sound1"

      expect(@sound.producer.email).to eq @producer.email
    end
  end

  describe "validations" do
    context "without a title" do
      before do
        @sound = Sound.create
      end

      it "does not save" do
        expect(@sound).to_not be_valid
      end
    end

    context "without a file" do
      before do
        @sound = Sound.create(title: "title")
      end

      it "does not save" do
        expect(@sound).to_not be_valid
      end
    end
  end
end
