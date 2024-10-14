class CreateCalendarCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :calendar_courses do |t|
      t.date :date, null: false
      t.belongs_to :course, null: false, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
