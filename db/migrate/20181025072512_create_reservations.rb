class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.timestamps
      t.belongs_to :user, name: 'member_id' , foreign_key: true
      t.belongs_to :duty, name: "duty_id", foreign_key: true
    end
  end
end
