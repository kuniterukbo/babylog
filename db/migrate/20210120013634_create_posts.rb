class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :room, null: false, foreign_key: true
      t.integer :event_id
      t.date :shooting_date
      t.timestamps
    end
  end
end

