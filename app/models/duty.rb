class Duty < ApplicationRecord
    belongs_to :user
    has_many :reservations

    validates :duty_name, :venue, :start_date_time, presence: true

    include PgSearch
    # multisearchable :agaist => [:duty_name, :venue]
    # scope :duty_name, -> (duty_name) { where duty_name: duty_name }
    # scope :venue, -> (venue) { where venue: venue }
    include Filterable

    pg_search_scope :search_fields, :against => :duty_name, :using => { :tsearch => {:prefix => true} }

    # searchkick
end
