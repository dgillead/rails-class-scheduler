class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :studio_id
      t.string :title, null: false
      t.string :description, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.integer :max_participants, null: false
      t.timestamps
    end
  end
end
