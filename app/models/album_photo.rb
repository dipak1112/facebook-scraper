class AlbumPhoto < ActiveRecord::Base
	belongs_to :album

	serialize :tags
	serialize :comments
	serialize :likes

end
