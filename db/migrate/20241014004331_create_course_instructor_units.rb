class CreateCourseInstructorUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :course_instructor_units do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.references :intructor, null: false, foreign_key: true
      t.references :unit, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
