class CreateCoursePeople < ActiveRecord::Migration[7.2]
  def change
    create_table :course_people do |t|
      t.references :course, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.references :manager, foreign_key: { to_table: :people }
      t.references :company, null: false, foreign_key: true
      t.references :operator, foreign_key: { to_table: :companies }
      t.references :inscription_motive, null: false, foreign_key: true
      t.references :fleet_category, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.date :date, null: false
      t.time :hour
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
