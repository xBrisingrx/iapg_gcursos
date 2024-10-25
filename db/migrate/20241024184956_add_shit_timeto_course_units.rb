class AddShitTimetoCourseUnits < ActiveRecord::Migration[7.2]
  def change
    add_column :course_units, :shift_time, :integer
  end
end
