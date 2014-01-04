require 'rest_client'
class StoreFriend
	@queue = :store_friend_queue
	def self.perform(my_friends, user_id)
		user = User.find(user_id)
		my_friends.each do |friend|
			begin
 		  	response = RestClient.get "https://graph.facebook.com/fql?q=SELECT%20friend_count%20FROM%20user%20WHERE%20uid=#{friend['id']}", {:accept => :json}
 		  	res = JSON.parse(response)
 		  	total_count = res["data"].first["friend_count"] || 0
 		  rescue
 		  end
 		  old_friend = MyFriend.find_by_user_id_and_username(user_id, friend["username"])
 		  store_profile_info(user.oauth_token, friend["id"])
 		  unless old_friend.present?
	 		  MyFriend.create(:user_id => user_id, :total_friend => total_count, :fbid => friend["id"], :first_name => friend["first_name"], :name => friend["name"], :last_name => friend["last_name"], :gender => friend["gender"], :locale => friend["locale"], :username => friend["username"], :picture_url => friend["picture"]["data"]["url"])	
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