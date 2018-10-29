require 'rails_helper'

RSpec.describe Duty, type: :model do
      context "validations" do
        it "should have duty_name and start_date_time" do
            should have_db_column(:duty_name).of_type(:string)
            should have_db_column(:start_date_time).of_type(:datetime)
        end
        describe "validates presence of attributes" do
            it { is_expected.to validate_presence_of(:duty_name) }
            it { is_expected.to validate_presence_of(:start_date_time) }
            it { is_expected.to validate_presence_of(:venue) }
        end
        context "associations" do
            it { should belong_to(:user) }
            it { is_expected.to have_many(:reservations) }
        end
    end
end
