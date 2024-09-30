class CreateCompanyAreas < ActiveRecord::Migration[7.2]
  def change
    create_table :company_areas do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :company_areas, :name, unique: true
  end
end
