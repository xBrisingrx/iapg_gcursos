class CreateCities < ActiveRecord::Migration[7.1]
  def change
    create_table :cities do |t|
      t.string :name, null: false, limit: 40
      t.references :province, null: false, foreign_key: true
      t.timestamps
    end
  end
end
