class CreateDuties < ActiveRecord::Migration[5.2]
  def change
    create_table :duties do |t|
      t.timestamps
      t.integer :created_by, index: true, foreign_key: true
      t.string :duty_name, null: false
      t.string :venue, null: false
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time, null: false
      t.string :contact_person, default: "-"
      t.string :contact_number, default: "-"
    end
  end
end
