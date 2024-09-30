class CreateCompanyCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :company_categories do |t|
      t.string :name, null: false
      t.string :description
      t.integer :quota, null: false
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :company_categories, :name, unique: true
  end
end
