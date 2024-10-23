class AddStartHourEndHoutToCourseInstructors < ActiveRecord::Migration[7.2]
  def change
    add_column :course_instructors, :start_hour, :time
    add_column :course_instructors, :end_hour, :time
  end
end
