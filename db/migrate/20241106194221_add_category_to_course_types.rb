class AddCategoryToCourseTypes < ActiveRecord::Migration[7.2]
  def change
    add_column :course_types, :category, :string, limit: 20
  end
end
