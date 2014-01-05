class StoreAlbum
	@queue = :store_album_queue
	def self.perform(user_id)
		user = User.find(user_id)
		graph = Koala::Facebook::API.new(user.oauth_token)
		albums = graph.get_connections('me', 'albums', fields: "id,name,link,cover_photo,count,type,created_time")
		if albums.present?
			albums.each do |alb|
				old_album = Album.find_by_albid(alb["id"])
				unless old_album.present?	
					album1 = Album.create(:user_id => user.id, :albid => alb["id"], :name => alb["name"], :link => alb["link"], :cover_photo => alb["cover_photo"], :photo_count => alb["count"], :upload_type => alb["type"], :alb_created_time => alb["created_time"])
					photos = graph.get_connections(alb["id"], 'photos', fields: "id,name,source,link,icon,place,created_time,tags,comments,likes")
					photos.each do |p|
						puts("========#{p.inspect}=======")
						albphoto = AlbumPhoto.new(:album_id => album1.id, :alphotoid => p["id"], :place => p["place"], :link => p["link"], :name => p["name"], :picture => p["source"], :created_time => p["created_time"], :icon => p["icon"])
						albphoto.tags = p["tags"]["data"] if p["tags"].present? && p["tags"]["data"].present? 
						albphoto.comments = p["comments"]["data"] if p["comments"].present? && p["comments"]["data"].present? 
						albphoto.likes = p["likes"]["data"] if p["likes"].present? && p["likes"]["data"].present? 
						albphoto.save
					end
				end
			end
		end
	end
end