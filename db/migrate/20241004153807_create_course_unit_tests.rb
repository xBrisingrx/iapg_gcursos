class CreateCourseUnitTests < ActiveRecord::Migration[7.2]
  def change
    create_table :course_unit_tests do |t|
      t.belongs_to :test, null: false, foreign_key: true
      t.belongs_to :course_unit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
