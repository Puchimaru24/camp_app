class CreateGearSets < ActiveRecord::Migration[5.2]
  def change
    create_table :gear_sets do |t|
      t.string :name

      t.timestamps
    end
  end
end
