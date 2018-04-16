class CreatePrivateChatRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :private_chat_rooms do |t|
      t.string :name
      t.timestamps
    end
  end
end
