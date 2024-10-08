class CreateCourseTypeUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :course_type_units do |t|
      t.references :course_type, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.integer :day
      t.time :start_hour
      t.time :end_hour
      t.time :start_brake
      t.time :end_brake
      t.boolean :is_by_turn

      t.timestamps
    end
  end
end
