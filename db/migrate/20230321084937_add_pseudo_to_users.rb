class AddPseudoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pseudo, :string
    add_column :users, :is_admin, :boolean
  end
end
