require 'rails_helper'

RSpec.describe Order, type: :model do
  context "valid attributes" do
    it "is valid with correct attributes" do
      order = Order.new(user_id:5)
      expect(order).to be_valid
    end

    it "is valid deactivate orders" do
      order = Order.new.instance_eval{ deactivate_orders(4) }
      expect(order).to match(true)
    end

    it "is valid deactivate orders" do
      order = Order.new.instance_eval{ calculate_total(1) }
      expect(order).to match(true)
    end

    it "is valid deactivate orders" do
      order = Order.new.instance_eval{ validate_products(1, 1) }
      expect(order).to match(false)
    end
  end

  context "invalid attributes" do
    it "a user cannot have more tha one order" do
      order = Order.new(user_id:1)
      expect(order).to be_invalid
    end
  end
end
