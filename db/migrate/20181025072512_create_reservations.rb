class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.timestamps
      # t.belongs_to :user, name: "member_id" , foreign_key: true
      t.integer :member_id, index_key: true, foreign_key: true # make sure reservation model has foreign_key: member_id 
      t.belongs_to :duty, foreign_key: true
    end
  end
end
