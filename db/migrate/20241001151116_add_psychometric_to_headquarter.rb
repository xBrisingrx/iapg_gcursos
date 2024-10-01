class AddPsychometricToHeadquarter < ActiveRecord::Migration[7.2]
  def change
    add_column :headquarters, :can_make_psychometric, :boolean, default: false
  end
end
