class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, default: :standard
    change_column :users, :role, :integer, default: :standard
  end
end
