class AddTitleToSets < ActiveRecord::Migration[5.2]
  def change
    add_column :gear_sets, :title, :string
  end
end
