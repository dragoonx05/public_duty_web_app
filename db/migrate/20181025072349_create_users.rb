class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.timestamps
      t.string :email, null: false
      t.string :password_digest, limit: 128, null: false
      t.string :name, null: false
      t.string :ic_number
      t.string :sjam_id
      t.string :division
      t.string :phone_number
      t.boolean :driver_status, default: false
      t.string :role, default: "Member" # Member, CVSC, PDC, Administrator
    end
  end
end
