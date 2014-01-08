class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string   :albid
      t.string   :name
      t.text   :link
      t.string   :cover_photo
      t.integer  :photo_count, :default => 0
      t.string   :upload_type
      t.integer  :user_id
      t.datetime :alb_created_time
      t.timestamps
    end
  end
end
