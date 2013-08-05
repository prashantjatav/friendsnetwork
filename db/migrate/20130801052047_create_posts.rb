class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :reciever_id
      t.integer :sender_id
      t.string :message
      t.string :share_with

      t.timestamps
    end
  end
end
