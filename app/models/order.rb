class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items
    has_many :products, through: :order_items
    before_validation :generate_order_number
    before_create :set_date
    validates :order_number, uniqueness: true
    validates :total, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
    validate :validate_user_order

    # Custum validations
    def validate_dates
        _today = Time.now.strftime("%d-%m-%Y").to_date
        if date != _today
            errors.add(:birth_date, "The date must be today.")
        end
    end

    private
    # Intance methods
    def deactivate_orders(_id)
        order = Order.find_by(user_id: _id)
        order.update_attribute(:active, false)
        return order
    end

    def generate_order_number
        code = SecureRandom.hex(3)
        if code != 0
            self.order_number = code
        end
    end

    def set_date
        today = Time.now.strftime("%d-%m-%Y").to_date
        self.date = today
    end

    def validate_user_order
        order = Order.find_by(user: self.user_id)
        if order != nil && order.active == true
            errors.add(:user_id, "The user can not have more than one order.")
        end
    end

    def calculate_total(id) # TODO
        result = 0
        order_items_order = OrderItem.find_by(order: id)
        for order_item in order_items_order do
            result += order_item.total
        end
        return result
    end
end
