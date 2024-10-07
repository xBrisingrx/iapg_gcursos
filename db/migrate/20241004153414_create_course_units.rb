class CreateCourseUnits < ActiveRecord::Migration[7.2]
  def change
    create_table :course_units do |t|
      t.belongs_to :course, null: false, foreign_key: true
      t.belongs_to :unit, null: false, foreign_key: true
      t.belongs_to :instructor, null: false, foreign_key: true
      t.string :shift
      t.integer :day

      t.timestamps
    end
  end
end
