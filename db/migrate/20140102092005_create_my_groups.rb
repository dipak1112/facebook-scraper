class CreateMyGroups < ActiveRecord::Migration
  def change
    create_table :my_groups do |t|
      t.string  :name
      t.integer :unread
      t.integer :bookmark_order
      t.string  :gid
      t.integer :user_id
      t.string  :icon
      t.string  :email
      t.datetime :updated_time
      t.integer :total_member
      t.text    :description
      t.timestamps
    end
  end
end
