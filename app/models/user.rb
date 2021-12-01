class User < ApplicationRecord
    has_secure_password
    validates :name, length: { minimum: 3 }
    validates :lastname, length: { minimum: 3 }
    validate :validate_dates
    validates :email_address, uniqueness:true
    validates :password, length: { in: 6..20}

    def validate_dates
        _today = Time.now.strftime("%d-%m-%Y").to_date
        if birth_date > _today
            errors.add(birth_date, "The day of birth must be less than today's date.")
        end
    end
end