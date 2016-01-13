require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "associations" do
    before do
      @producer = Producer.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")
      @sound = Sound.new(title: "Sound1")
      @sound.file = File.open("spec/support/test.wav")
      @sound.producer = @producer
      @sound.save!
      @comment = Comment.create!(body: "This is a comment.", sound: @sound)
      @comment.producer = @producer
      @comment.save!
    end

    after do
      path = @sound.file.path.split("/")
      path.pop
      FileUtils.rm_rf(path.join("/"))
    end

    it "belongs to a sound" do
      expect(@sound.comments.length).to eq 1
      expect(@sound.comments.first.body).to eq "This is a comment."
    end

    it "belongs to a producer" do
      expect(@producer.comments.length).to eq 1
      expect(@comment.producer.email).to eq @producer.email
    end
  end

  describe "validations" do
    context "without a body" do
      before do
        @comment = Comment.create
      end

      it "is not valid without a body" do
        expect(@comment).to_not be_valid
      end
    end

    context "with a body of less than 5 characters" do
      before do
        @comment = Comment.create(body: "hi")
      end

      it "is not valid without a body" do
        expect(@comment).to_not be_valid
      end
    end
  end
end
