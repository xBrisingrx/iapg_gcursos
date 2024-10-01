class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :description
      t.integer :capacity, null: false
      t.references :headquarter, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
