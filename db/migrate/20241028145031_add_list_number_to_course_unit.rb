class AddListNumberToCourseUnit < ActiveRecord::Migration[7.2]
  def change
    add_column :course_units, :n_list, :integer, default: 1
  end
end
