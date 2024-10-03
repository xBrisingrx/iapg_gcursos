class CreateCoursesUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :courses_units do |t|
      t.references :course, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.references :intructor, null: false, foreign_key: true
      t.string :shift, null: false
      t.integer :day, null: false

      t.timestamps
    end
  end
end
