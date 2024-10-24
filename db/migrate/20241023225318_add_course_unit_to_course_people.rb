class AddCourseUnitToCoursePeople < ActiveRecord::Migration[7.2]
  def change
    add_reference :course_people, :course_unit, null: false, foreign_key: true
  end
end
