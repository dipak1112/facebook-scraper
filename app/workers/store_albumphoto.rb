class StoreAlbumphoto
	@queue = :store_album_photo_queue
	def self.perform(alb_id, user_id)
		user = User.find(user_id)
		graph = Koala::Facebook::API.new(user.oauth_token)
		#user.albums.each do |album|
			photos = graph.get_connections(alb_id, 'photos', fields: "id,name,source,link,icon,place,created_time,tags,comments,likes")
			if photos.present?
				photos.each do |p|
					old_photo = Photo.find_by_alphotoid(p["id"])
					unless old_photo.present?
						AlbumPhoto.create(:album_id => album.id, :alphotoid => p["id"], :place => p["place"], :link => p["link"], :name => p["name"], :picture => p["source"], :created_time => p["created_time"], :icon => p["icon"], :tags => p["tags"]["data"], :comments => p["comments"]["data"], :likes => p["likes"]["data"] )
					end
				end
			end
		# end
	end
end