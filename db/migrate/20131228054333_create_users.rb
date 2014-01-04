class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :image
      t.string :fburl
      t.string :locations
      t.string :fbid
      t.string :username
      t.string :gender
      t.string :timezone
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
  end
end
