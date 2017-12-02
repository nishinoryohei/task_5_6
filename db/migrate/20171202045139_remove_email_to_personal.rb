class RemoveEmailToPersonal < ActiveRecord::Migration[5.1]
  def change
    remove_column :personals, :email, :string
  end
end
