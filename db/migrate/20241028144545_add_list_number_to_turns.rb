class AddListNumberToTurns < ActiveRecord::Migration[7.2]
  def change
    add_column :turns, :n_list, :integer
  end
end
