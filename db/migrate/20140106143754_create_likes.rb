class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.string :fbid
      t.string :name
      t.integer :album_photo_id
	  t.integer 	:mixable_id
      t.string 		:mixable_type
      t.timestamps
    end
  end
end
