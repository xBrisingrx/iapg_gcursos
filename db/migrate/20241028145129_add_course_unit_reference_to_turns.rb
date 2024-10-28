class AddCourseUnitReferenceToTurns < ActiveRecord::Migration[7.2]
  def change
    add_reference :turns, :course_unit, null: false, foreign_key: true
  end
end
