require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  context "valid attributes" do
    it "is valid with correct attributes" do
      order_item = OrderItem.new(order_id:1, product_id:3, quantity:3)
      expect(order_item).to be_valid
    end
  end

  context "invalid attributes" do
    it "quantity the must be number" do
      order_item = OrderItem.new(order_id:1, product_id:3, quantity:'a')
      expect(order_item).to be_invalid
    end

    it "quantity the must be greater than 0" do
      order_item = OrderItem.new(order_id:1, product_id:5, quantity:0)
      expect(order_item).to be_invalid
    end

    it "the product cannot be inactive" do
      order_item = OrderItem.new(order_id:1, product_id:5, quantity:0)
      expect(order_item).to be_invalid
    end

  end
end
