class User < ApplicationRecord
    validates :name, length: { minimum: 3 }
    validates :lastname, length: { minimum: 3 }
    validates :birth_date, presence: true, if: :validate_dates?
    validates :email_address, uniqueness: true
    validate :password length: { in: 6..20}, confirmation: true
    has_secure_password
    has_secure_password :password, validations: false

    def validate_dates
        :birth_date < Date.today
    end
end