class CreateGears < ActiveRecord::Migration[5.1]
  def change
    create_table :gears do |t|
      t.string :category
      t.string :name
      t.string :maker
      t.integer :price
      t.string :memo

      t.timestamps
    end
  end
end
