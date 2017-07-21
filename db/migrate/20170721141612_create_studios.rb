class CreateStudios < ActiveRecord::Migration[5.1]
  def change
    create_table :studios do |t|
      t.integer :user_id
      t.string :name, null: false
      t.string :description, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end
