class CreateWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :subdomain
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
