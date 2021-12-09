class User < ApplicationRecord
    has_secure_password
    has_many :orders
    has_many :order_items, through: :order
    validates :name, length: { minimum: 3 }
    validates :lastname, length: { minimum: 1 }
    validates :password, length: { in: 6..20}
    validates :email_address, uniqueness:true, format: {with: URI::MailTo::EMAIL_REGEXP}
    validate :validate_dates, :validate_different_name_and_lastname, :validate_password_characters

    # Scope to get active users
    scope :active_users, -> { where(active: true) }


    # Custum validations
    protected
    def validate_dates
        _today = Time.now.strftime("%d-%m-%Y").to_date
        if birth_date >= _today
            errors.add(:birth_date, "The day of birth must be less than the current date.")
        end
    end

    def validate_different_name_and_lastname
        if name.downcase == lastname.downcase
            errors.add(:lastname, "The lastname must be different than name.")
        end
    end

    def validate_password_characters
        requirements = {
            " must contain at least one lowercase letter"  => /[a-z]+/,
            " must contain at least one uppercase letter"  => /[A-Z]+/,
            " must contain at least one digit"             => /\d+/,
            " must contain at least one special character" => /[^A-Za-z0-9]+/
        }

        requirements.each do |message, regex|
            errors.add( :password, message ) unless password.match( regex )
        end
    end

    # Intance methods
    def deactivate_users(id)
        user = User.find(id)
        user.update_attribute(:active, false)
    end

    def get_age(id)
        user = User.find(id)
        _age = (Time.now.to_s(:number).to_i - user.birth_date.to_time.to_s(:number).to_i)/10e9.to_i
        return _age
    end
        
end