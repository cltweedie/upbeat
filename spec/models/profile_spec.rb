require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "association with user" do
    before do
      @producer = Producer.create!(email: Faker::Internet.email,
                                    password: "password",
                                    password_confirmation: "password")
    end

    it "is created and assigned to a producer" do
      expect(@producer.profile).to_not be_nil
    end
  end
end
