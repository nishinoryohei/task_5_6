class AddNameExhibitorToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :exhibitor, :boolean, default: false
  end
end
