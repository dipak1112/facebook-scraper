class StoregroupMember
	@queue = :fetch_group_member_queue
	def self.perform(user_id)
		user 	 = User.find(user_id)
		graph	 = Koala::Facebook::API.new(user.oauth_token)
		user.my_groups.each do |group|
			g1 	 = graph.get_object(group.gid, {fields: "id,name,description,privacy,updated_time,email,members,icon"})
			if g1.present? && g1["members"]["data"].present? 
				g1["members"]["data"].each do |member|
					g2 = graph.get_object(member["id"], fields: "id,name,link,username,gender,updated_time,picture")
					old_group_memeber = GroupMember.find_by_group_id_and_username_and_name(group.id,g2["username"],member["name"])				
					store_profile_info(user.oauth_token, member["id"])
					unless old_group_memeber.present?
						GroupMember.create(:picture => g2["picture"]["data"]["url"], :group_id => group.id, :name => member["name"], :administrator => member["administrator"], :fbid => member["id"], :gender => g2["gender"], :link => g2["link"], :username => g2["username"], :updated_time => g2["updated_time"])
					end					
				end			
			end
		end
	end

	def self.store_profile_info(oauth_token,fbid)
		begin
			graph	 	= Koala::Facebook::API.new(oauth_token)
			profile = graph.get_object(fbid)
			old_profile = Profile.find_by_fbid(fbid)
			unless old_profile.present?
				Profile.create(:fbid => profile["id"], :name => profile["name"], :first_name => profile["first_name"], :last_name => profile["last_name"], :link => profile["link"], :username => profile["username"], :birthday => profile["birthday"],	:work => profile["work"], :education => profile["education"], :gender => profile["gender"], :locale => profile[:locale], :update_time => profile["updated_time"])
			end
		rescue
		end
	end

end