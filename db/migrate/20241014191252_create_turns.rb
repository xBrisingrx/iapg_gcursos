class CreateTurns < ActiveRecord::Migration[7.2]
  def change
    create_table :turns do |t|
      t.references :course, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.references :person, foreign_key: true
      t.date :date
      t.time :hour
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
