class FetchGroup
	@queue = :fetch_group_queue
	def self.perform(user_id)
		user 			 = User.find(user_id)
		graph 	 	 = Koala::Facebook::API.new(user.oauth_token)
		my_groups  = graph.get_connections("me", "groups")
		if my_groups.present? 
			my_groups.each do |my_g|
				old_group = MyGroup.find_by_user_id_and_name(user_id, my_g["name"])
				unless old_group.present? 
					group = graph.get_object(my_g["id"], {fields: "id,name,description,privacy,updated_time,email,members,icon" })
					desc = group["description"].present? ? group["description"] : ""
					MyGroup.create(:description => desc, :total_member => group["members"]["data"].count, :email => group[:email] ,:updated_time => group["updated_time"] ,:icon => group["icon"], :name => my_g["name"], :unread => my_g["unread"], :bookmark_order => my_g["bookmark_order"], :gid => my_g["id"], :user_id => user.id)
				end					
			end
		end
		Resque.enqueue(StoregroupMember, user.id) if user.present? 
	end
end