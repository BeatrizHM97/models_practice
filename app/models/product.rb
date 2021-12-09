class Product < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items
    validates :name, length: { minimum: 3 }
    validates :code, uniqueness: true, length: { minimum: 4 }
    validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
    validates :quantity, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }, numericality: {greater_than: 0}
    validate :validate_code_characters, :validate_price

    protected
    def validate_price
        if price <= 0.0
            errors.add(:price, "The price must be greater than 0.0.")
        end
    end

    def validate_code_characters
        requirements = {
            " must contain at least one uppercase letter"  => /[A-Z]+/,
            " must contain at least one digit"             => /\d+/,
            " must contain at least one special character" => /[^A-Za-z0-9]+/
        }

        requirements.each do |message, regex|
            errors.add( :code, message ) unless code.match( regex )
        end
    end

    # Intance methods
    def deactivate_products(id)
        product = Product.find(id)
        product.update_attribute(:active, false)
    end
end