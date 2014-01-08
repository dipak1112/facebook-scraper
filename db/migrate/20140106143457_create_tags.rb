class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string 		:fbid
      t.string 		:name
      t.integer 	:mixable_id
      t.string 		:mixable_type
      t.timestamps
    end
  end
end
