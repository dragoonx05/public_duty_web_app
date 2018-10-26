class User < ApplicationRecord
    has_many :duties
    has_many :reservations
    has_many :authentications, dependent: :destroy
    has_secure_password
    before_validation :set_driver_status

    validates :email, :password, :email, :ic_number, :division, :phone_number, presence: true
    validates :email, uniqueness: true, format: { with: /(\w{1,})@(\w{1,})\.\w{2,}(\.\w{2,})?/, message: "invalid email format" }

    def set_driver_status
        status = self.driver_status
        if status == 0
            self.driver_status = false
        end
    end

    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end

end
 