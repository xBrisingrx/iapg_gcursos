class AddShifttoCourseTypeUnit < ActiveRecord::Migration[7.2]
  def change
    add_column :course_type_units, :shift, :string
  end
end
