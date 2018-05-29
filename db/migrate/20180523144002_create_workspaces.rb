class CreateWorkspaces < ActiveRecord::Migration[5.1]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :subdomain_url

      t.timestamps
    end
  end
end
