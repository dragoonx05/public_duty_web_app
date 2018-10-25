class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
