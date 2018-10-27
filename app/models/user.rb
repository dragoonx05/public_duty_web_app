class User < ApplicationRecord
    has_many :duties
    has_many :reservations
    has_many :authentications, dependent: :destroy
    has_secure_password

    # before_validate :default_role

    validates :email, :password, :email, :ic_number, :division, :phone_number, presence: true
    validates :email, uniqueness: true, format: { with: /(\w{1,})@(\w{1,})\.\w{2,}(\.\w{2,})?/, message: "invalid email format" }
    validates :ic_number, uniqueness: true#, format: { with: }
    validates :sjam_id, uniqueness: true#, format: { with: }
    # validates :phone_number, format: { with: }

    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end

end
 