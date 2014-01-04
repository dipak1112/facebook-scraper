class FetchFriend
	@queue = :fetch_friend_queue
	def self.perform(user_id)
		user = User.find(user_id)
		graph = Koala::Facebook::API.new(user.oauth_token)
		my_friends = graph.get_connections('me','friends',:fields=>"id,interested_in,relationship_status,first_name,last_name,name,username,birthday,hometown,location,gender,locale,picture")
		Resque.enqueue(StoreFriend, my_friends, user.id)
	end
end