class AddTimesToCourseUnits < ActiveRecord::Migration[7.2]
  def change
    add_column :course_units, :start_hour, :time
    add_column :course_units, :end_hour, :time
    add_column :course_units, :date, :date
  end
end
