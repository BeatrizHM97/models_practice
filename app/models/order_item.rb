class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :product
    validates :total, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
    validates :quantity, numericality: true
    before_create :set_total
    validate :validate_quantity, :validate_product

    # Custum validations
    def validate_product
        product = Product.find_by(id: product_id)
        if product.active == false
            errors.add(:product_id, "Can not add deactivate products.")
        end
    end

    def validate_quantity
        if quantity <= 0
            errors.add(:quantity, "The quantity can not be less or equal to 0.")
        end
    end

    private
    # Intance methods
    def set_total
        product = Product.find_by(id: self.product_id)
        product_price = product.price 
        self.total = self.quantity * product_price
    end

end
