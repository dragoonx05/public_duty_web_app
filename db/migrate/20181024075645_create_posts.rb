class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.timestamps
      t.belongs_to :user, name: 'created_by', index: true
      t.string :duty_name, null: false
      t.string :venue, null: false
      t.datetime :start_date_time, null: false
      t.datetime :end_date_time, null: false
      t.string :contact_person, default: "-"
      t.string :contact_number, defualt: "-"
    end
  end
end
