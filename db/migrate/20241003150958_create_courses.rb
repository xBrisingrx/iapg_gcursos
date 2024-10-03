class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.date :date, null: false
      t.integer :year_number, null: false
      t.integer :general_number, null: false
      t.boolean :is_company, default: false
      t.references :course_type, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.references :company, foreign_key: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
