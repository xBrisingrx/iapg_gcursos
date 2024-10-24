class AddCourseTypeUnitToCoursePeople < ActiveRecord::Migration[7.2]
  def change
    add_reference :course_people, :course_type_unit, null: false, foreign_key: true
  end
end
