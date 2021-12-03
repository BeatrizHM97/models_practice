class Product < ApplicationRecord
    validates :name, length: { minimum: 3 }
    validates :code, uniqueness: true, length: { minimum: 4 }
    validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
    validates :quantity, format: { with: /\A[0-9]+\z/, message: "only allows numbers" }, numericality: {greater_than: 0}
    validate :validate_code_characters, :validate_price

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

    private
        # Intance methods
        def deactivate_products(_id)
            product = Product.find_by(id: _id)
            product.update_attribute(:active, false)
            return product
        end
end