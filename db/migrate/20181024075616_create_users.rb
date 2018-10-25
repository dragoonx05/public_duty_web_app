class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t. timestamps
      t.string :email, null: false
      t.string :password_digest, limit: 128, null: false
      t.string :name, null: false
      t.string :ic_number, null: false
      t.string :sjam_id, null: false
      t.string :division, null: false
      t.string :phone_number
      t.string :role
    end
  end
end
