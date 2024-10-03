class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.string :name, null: false
      t.string :instance, null: false
      t.string :fleet, null: false
      t.string :modality, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
