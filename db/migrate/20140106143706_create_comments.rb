class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :fbid
      t.string :cmtid
      t.string :name
      t.string :message
      t.datetime :created_time
      t.integer :like_count
      t.integer :album_photo_id
      t.integer   :mixable_id
      t.string    :mixable_type
      t.timestamps
    end
  end
end
