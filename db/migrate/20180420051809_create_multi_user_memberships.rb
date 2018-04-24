class CreateMultiUserMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :multi_user_memberships do |t|
      t.references :multi_user_private_chat_room, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
