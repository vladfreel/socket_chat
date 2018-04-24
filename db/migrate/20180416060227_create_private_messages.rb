class CreatePrivateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :private_chat_room, foreign_key: true

      t.timestamps
    end
  end
end
