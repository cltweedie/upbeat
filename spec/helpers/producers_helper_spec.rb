require 'rails_helper'

RSpec.describe ProducersHelper, type: :helper do
  describe "producer_is_this_one?" do
    before do
      @producer = Producer.create!(email: Faker::Internet.email,
                                  password: "password",
                                  password_confirmation: "password")
      @params = {
        producer_id: @producer.id
      }
    end

    it "returns true if the currently logged in producer is the same as the one in the params" do
      expect(ProducersHelper.producer_is_this_one?(@producer, @params)).to eq true
    end
  end
end
