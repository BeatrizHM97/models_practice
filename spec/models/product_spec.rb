require 'rails_helper'

RSpec.describe Product, type: :model do
  context "valid attributes" do
    it "is valid with correct attributes" do
      product = Product.new(name:'Parlante', code:'PL-1', price:50.09, quantity:12)
      expect(product).to be_valid
    end

    it "is valid deactivate products" do
      product = Product.new.instance_eval{ deactivate_products(7) }
      expect(product).to match(true)
    end
  end

  context "invalid attributes" do
    it "cannot have 0.0 of price" do
      product = Product.new(name:'Parlante', code:'PL-1', price:0.0, quantity:12)
      expect(product).to be_invalid
    end
    
    it "the name cannot have less tha 3 digits" do
      product = Product.new(name:'P', code:'PL-1', price:50.09, quantity:12)
      expect(product).to be_invalid
    end
    
    it "the code must be unique" do
      product = Product.new(name:'Parlante', code:'AU-1', price:50.09, quantity:12)
      expect(product).to be_invalid
    end
    
    it "the code cannot have less tha 4 digits" do
      product = Product.new(name:'Parlante', code:'P-1', price:50.09, quantity:12)
      expect(product).to be_invalid
    end
    
    it "quantity the must be number" do
      product = Product.new(name:'Parlante', code:'PL-1', price:50.09, quantity:'number')
      expect(product).to be_invalid
    end
    
    it "quantity the must greater than 0" do
      product = Product.new(name:'Parlante', code:'PL-1', price:50.09, quantity:0)
      expect(product).to be_invalid
    end
  end
end
