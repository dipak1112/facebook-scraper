class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :fbid
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :link
      t.string :username
      t.string :birthday
      t.string :work
      t.text :education
      t.string :gender
      t.string :locale
      t.datetime :update_time

      t.timestamps
    end
  end
end
