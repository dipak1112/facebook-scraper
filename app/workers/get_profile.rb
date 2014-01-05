class GetProfile
	@queue = :get_profile_queue
	def self.perform(user_id)
		begin
			user = User.find(user_id)
			if user.oauth_token.present? 
				graph = Koala::Facebook::API.new(user.oauth_token)
				profile = graph.get_object("me")
				user.employee_info = profile["work"].first
				user.education_history = profile["education"].present? ? profile["education"] : ""
				user.save if profile["work"].first.present?
			end
			Resque.enqueue(FetchFriend, user.id) ## For Fetching Friend
			Resque.enqueue(StoreAlbum, user.id)  ## For Fetching and Storing Album
			Resque.enqueue(FetchGroup, user_id) ## Fetching Groups and Store into DB
		rescue
		end
	end
end