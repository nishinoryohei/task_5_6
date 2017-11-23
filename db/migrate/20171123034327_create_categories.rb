class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.integer :area
      t.integer :color
      t.integer :item_id

      t.timestamps
    end
  end
end
