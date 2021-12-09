require 'rails_helper'

RSpec.describe Order, type: :model do
  context "valid attributes" do
    it "is valid with correct attributes" do
      order = Order.new(user_id:3)
      expect(order).to be_valid
    end
  end

  context "invalid attributes" do
    it "a user cannot have more tha one order" do
      order = Order.new(user_id:1)
      expect(order).to be_invalid
    end
  end
end
