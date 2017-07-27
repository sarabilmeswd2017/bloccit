require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisement) { Advertisement.create!(title: "New Advertisement", body: "New Advertisement Body", price: "New Advertisement Price") }

  describe "attributes" do
    it "should have the attributes" do
      expect(advertisement).to have_attributes(title: "New Advertisement", body: "New Advertisement Body", price: "New Advertisement Price")
    end
  end
end
