class AddOrderIdToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :order_id, :integer
  end
end
