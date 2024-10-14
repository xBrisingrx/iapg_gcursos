class CreateInstructorCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :instructor_courses do |t|
      t.datetime :date, null: false
      t.belongs_to :instructor, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
