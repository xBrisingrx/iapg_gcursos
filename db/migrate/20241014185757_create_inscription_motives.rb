class CreateInscriptionMotives < ActiveRecord::Migration[7.2]
  def change
    create_table :inscription_motives do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
