class User < ApplicationRecord
    has_many :duties
    has_many :reservations
    has_many :authentications, dependent: :destroy
    has_secure_password

    def password
        @password ||= Password.new(password_hash)
    end

    def password=(new_password)

    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end

end
 