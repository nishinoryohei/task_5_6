class AddDefaultTocarts < ActiveRecord::Migration[5.1]
  def change
  	change_column_default :carts, :quantity, 0
  end
end
