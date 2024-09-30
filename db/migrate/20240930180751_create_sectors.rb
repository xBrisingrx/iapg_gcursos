class CreateSectors < ActiveRecord::Migration[7.2]
  def change
    create_table :sectors do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :sectors, :name, unique: true
  end
end
