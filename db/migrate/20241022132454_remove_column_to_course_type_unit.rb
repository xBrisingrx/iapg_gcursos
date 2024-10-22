class RemoveColumnToCourseTypeUnit < ActiveRecord::Migration[7.2]
  def change
    remove_column :course_type_units, :start_brake
    remove_column :course_type_units, :end_brake
  end
end
