class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :babyname,   null: false
      t.integer :gender_id,   null: false
      t.date :birthday,   null: false
      t.timestamps
    end
  end
end