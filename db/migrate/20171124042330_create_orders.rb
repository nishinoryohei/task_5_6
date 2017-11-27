class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.date :order_date
      t.integer :total_fee

      t.timestamps
    end
  end
end
