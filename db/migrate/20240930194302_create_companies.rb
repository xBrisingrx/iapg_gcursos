class CreateCompanies < ActiveRecord::Migration[7.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit: 100
      t.string :cuit, null: false, limit: 30
      t.string :direction, limit: 100
      t.string :phone, limit: 40
      t.boolean :operator, null: false, default: false
      t.string :comment
      t.references :iva_condition, null: false, foreign_key: true
      t.references :company_category, null: false, foreign_key: true
      t.references :sector, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :companies, :name, unique: true
    add_index :companies, :cuit, unique: true
  end
end
