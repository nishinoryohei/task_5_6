class AddUserIdToPersonal < ActiveRecord::Migration[5.1]
  def change
    add_column :personals, :user_id, :integer
  end
end
