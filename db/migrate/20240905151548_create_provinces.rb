class CreateProvinces < ActiveRecord::Migration[7.2]
  def change
    create_table :provinces do |t|
      t.string :name, null: false, limit: 20
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
