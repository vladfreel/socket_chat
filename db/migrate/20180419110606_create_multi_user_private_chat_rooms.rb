class CreateMultiUserPrivateChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :multi_user_private_chat_rooms do |t|
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
