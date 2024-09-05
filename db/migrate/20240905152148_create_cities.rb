class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false, limit: 40
      t.boolean :active, default: true
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end

    add_index :cities, [:name, :province_id], unique: true
  end
end
