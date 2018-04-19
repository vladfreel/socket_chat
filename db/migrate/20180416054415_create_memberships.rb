class CreateMemberships < ActiveRecord::Migration[5.1]
  # def change
  #   create_table :memberships do |t|
  #     t.references :user, foreign_key: true
  #     t.references :private_chat_room, foreign_key: true
  #     t.timestamps
  #   end
  # end
  def change
  create_table :memberships do |t|
      t.references :private_chat_room, foreign_key: true
      t.references :owner
      t.references :member
    end

    # Rails 5+ only: add foreign keys
    add_foreign_key :memberships, :users, column: :owner_id, primary_key: :id
    add_foreign_key :memberships, :users, column: :member_id, primary_key: :id
  end
end
