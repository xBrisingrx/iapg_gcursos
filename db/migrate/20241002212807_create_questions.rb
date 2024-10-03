class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.string :fleet, null: false
      t.boolean :eliminating, default: false
      t.integer :score, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
