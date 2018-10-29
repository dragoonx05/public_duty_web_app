class Reservation < ApplicationRecord
    belongs_to :user, foreign_key :member_id
    belongs_to :duty

    
end
