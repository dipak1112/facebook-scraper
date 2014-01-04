class CreateGroupMemebers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.string :name
      t.boolean :administrator
      t.string :fbid
      t.string :gender
      t.string :link
      t.string :username
      t.datetime :updated_time
      t.integer :group_id
      t.string :picture
      t.timestamps
    end
  end
end
