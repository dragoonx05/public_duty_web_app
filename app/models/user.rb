class User < ApplicationRecord
    has_many :duties
    has_many :reservations
    has_many :authentications, dependent: :destroy
    has_secure_password

    # before_validate :default_role

    # validates :email, :password, :name, :ic_number, :division, :phone_number, presence: true
    validates :email, :name, presence: true
    validates :password, presence: true, :if => :should_validate_password? # check if the password is being updated or new record
    validates :email, uniqueness: true, format: { with: /(\w{1,})@(\w{1,})\.\w{2,}(\.\w{2,})?/, message: "invalid email format" }
    validates :ic_number, uniqueness: true#, format: { with: }
    validates :sjam_id, uniqueness: true#, format: { with: }
    # validates :phone_number, format: { with: }
    attr_accessor :updating_password # read password only

    # specify if the password is being updated and for validation to occur
    def should_validate_password?
        updating_password || new_record?
    end

    #----- google oauth -----# (not in use)
    def self.create_with_auth_and_hash(authentication, auth_hash)
        user = self.create!(
            name: auth_hash["info"]["name"],
            email: auth_hash["info"]["email"],
            password: SecureRandom.hex(10),
            ic_number: "920103140001",
            sjam_id: "WP-0069",
            division: "Kuala Lumpur Pudu Combined Adult",
            phone_number: "0122331312"
        )
        user.authentications << authentication
        return user
    end

    def google_token
        x = self.authentications.find_by(provider: 'google_oauth2')
        return x.token unless x.nil?
    end

end
 