class CreateCourseUnitTests < ActiveRecord::Migration[7.2]
  def change
    create_table :course_unit_tests do |t|
      t.references :test, null: false, foreign_key: true
      t.references :courses_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
