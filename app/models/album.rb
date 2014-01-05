class Album < ActiveRecord::Base
	belongs_to :user
	has_many :album_photos, :dependent => :destroy
end
