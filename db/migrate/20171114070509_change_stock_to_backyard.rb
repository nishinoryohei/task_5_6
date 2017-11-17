class ChangeStockToBackyard < ActiveRecord::Migration[5.1]
  def change
  	change_column :backyards, :stock, :integer , default: 1
  end
end
