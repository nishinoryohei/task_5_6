class CreateBackyards < ActiveRecord::Migration[5.1]
  def change
    create_table :backyards do |t|
      t.integer :stock

      t.timestamps
    end
  end
end
