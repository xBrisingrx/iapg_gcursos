class CreateCalendarInstructors < ActiveRecord::Migration[7.2]
  def change
    create_table :calendar_instructors do |t|
      t.references :instructor, null: false, foreign_key: true
      t.datetime :date, null: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
