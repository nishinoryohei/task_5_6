class AddItemIdToBackyard < ActiveRecord::Migration[5.1]
  def change
    add_column :backyards, :item_id, :integer
  end
end
