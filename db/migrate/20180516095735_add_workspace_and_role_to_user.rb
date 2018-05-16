class AddWorkspaceAndRoleToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :display_name, :string
    add_column :users, :role, :integer
    add_reference :users, :workspace, foreign_key: true
  end
end
