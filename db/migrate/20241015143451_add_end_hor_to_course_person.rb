class AddEndHorToCoursePerson < ActiveRecord::Migration[7.2]
  def up
    rename_column :course_people, :hour, :from_hour
    add_column :course_people, :to_hour, :time
  end

  def down
    rename_column :course_people, :from_hour, :hour
    remove_column :course_people, :to_hour
  end
end
