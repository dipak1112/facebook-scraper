class CreateMyFriends < ActiveRecord::Migration
  def change
    create_table :my_friends do |t|
      t.string :fbid
      t.string :first_name
      t.string :name
      t.string :last_name
      t.string :gender
      t.string :locale
      t.string :username
      t.string :picture_url
      t.integer :user_id
      t.integer :total_friend, :default => 0
      t.timestamps
    end
  end
end
