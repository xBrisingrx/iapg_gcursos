class CreateHeadquarters < ActiveRecord::Migration[7.2]
  def change
    create_table :headquarters do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :headquarters, :name, unique: true
  end
end
