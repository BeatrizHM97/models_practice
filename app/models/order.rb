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
        errors.add(:date, 'The date must be today.') if date != _today
    end

    private
    # Intance methods
    def deactivate_orders(_id)
        order = Order.find_by(user: _id)
        order.update_attribute(:active, false)
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

    def calculate_total(id)
        order = Order.find(id)
        total = order.order_items.reduce(0) { |suma, order_item| suma += order_item.total }
        order.update_attribute(:total, total)
    end
    
end
