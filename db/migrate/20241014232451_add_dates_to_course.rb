class AddDatesToCourse < ActiveRecord::Migration[7.2]
  def up
    rename_column :courses, :date, :from_date
    add_column :courses, :to_date, :date
  end

  def down
    rename_column :courses, :from_date, :date
    remove_column :courses, :to_date
  end
end
