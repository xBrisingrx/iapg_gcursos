class AddReferencesToHeadquarters < ActiveRecord::Migration[7.2]
  def change
    add_reference :headquarters, :sectional, null: false, foreign_key: true
    add_reference :headquarters, :province, null: false, foreign_key: true
    add_reference :headquarters, :city, null: false, foreign_key: true
  end
end
