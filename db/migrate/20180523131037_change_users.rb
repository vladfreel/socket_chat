class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
    change_column :users, :email, :string, null: false

    remove_index :users, :username
    remove_column :users, :username, :string

    remove_column :users, :provider, :string
    remove_column :users, :uid, :string
    remove_column :users, :name, :string
    remove_column :users, :image, :text

    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :display_name, :string
  end
end
