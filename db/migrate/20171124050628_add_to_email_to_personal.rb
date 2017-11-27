class AddToEmailToPersonal < ActiveRecord::Migration[5.1]
  def change
    add_column :personals, :email, :string
  end
end
