class AddIsPurchaseToCart < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :is_purchase, :boolean, default: true
  end
end
