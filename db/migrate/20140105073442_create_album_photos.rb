class CreateAlbumPhotos < ActiveRecord::Migration
  def change
    create_table :album_photos do |t|
      t.integer :album_id
      t.string :name
      t.string :picture
      t.string :link
      t.string :icon
      t.text :place
      t.datetime :created_time
      t.text :tags
      t.text :comments
      t.text :likes
      t.string :alphotoid

      t.timestamps
    end
  end
end
