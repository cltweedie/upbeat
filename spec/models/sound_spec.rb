require 'rails_helper'

RSpec.describe Sound, type: :model do
  describe "relations" do
    before do
      @sound = Sound.new(title: "Sound1")
      @sound.file = File.open("spec/support/test.wav")
      @producer = Producer.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")
      @producer.sounds << @sound
      @instrument = Instrument.create!(name: "Drums")
      @sound.instrument = @instrument
      @category = Category.create!(name: "Hits")
      @sound.category = @category

      @sound.tags << Tag.create!(name: "tag1")
      @sound.tags << Tag.create!(name: "tag2")
      @sound.tags << Tag.create!(name: "tag3")
      @sound.save!
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

    it "belongs to an instrument" do
      expect(@sound.instrument.name).to eq "Drums"
      expect(@instrument.sounds.length).to eq 1
    end

    it "belongs to a category" do
      expect(@sound.category.name).to eq "Hits"
      expect(@category.sounds.length).to eq 1
    end

    it "has many tags" do
      expect(@sound.tags.length).to eq 3
      expect(@sound.tags.first.name).to eq "tag1"
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

  describe "create_tags" do
    it "creates tags from a comma-separated string" do
      @sound = Sound.new(title: "Sound1")
      @sound.file = File.open("spec/support/test.wav")
      @sound.save!

      @sound.create_tags("this, is, a, list, of, tags")

      expect(@sound.tags.length).to eq 6
      expect(@sound.tags.first.name).to eq "this"
    end

    after do
      path = @sound.file.path.split("/")
      path.pop
      FileUtils.rm_rf(path.join("/"))
    end
  end
end
