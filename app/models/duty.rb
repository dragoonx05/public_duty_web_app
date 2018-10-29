class Duty < ApplicationRecord
    belongs_to :user
    has_many :reservations

    # include PgSearch
    # multisearchable :agaist => [:duty_name, :venue]
    # scope :duty_name, -> (duty_name) { where duty_name: duty_name }
    # scope :venue, -> (venue) { where venue: venue }

    # searchkick
end
