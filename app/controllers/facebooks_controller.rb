class FacebooksController < ApplicationController

	## Post on Wall
	before_action :get_token, :only => [:send_album_in_facebook, :send_photo_in_album]
	
	def wall_post
	end

	def send_wall_post
		token = current_user.oauth_token
		me = FbGraph::User.me(token)
		me.feed!(
  		:message => params[:message], 
  		:picture => params[:picture],
  		:link => params[:link], 
  		:name => params[:name], 
  		:description => params[:description]
		)
		redirect_to root_path, :notice => "Successfully Send..!"
	end


	## Post a Note
	def link_post
	end

	def send_link_post
		token = current_user.oauth_token
		me = FbGraph::User.me(token)
		link = me.link!(
			:link => params[:link], 
	 		:message => params[:message]
		)
		redirect_to root_path, :notice => "Successfully Send..!"
	end

	## Create a Event
	def create_event
	end

	def send_created_event
		token = current_user.oauth_token
		me = FbGraph::User.me(token)
		event = me.event!(
  		:name => params[:name],
  		:start_time => params[:start_date].to_date,
  		:end_time => params[:end_date].to_date
		)
		redirect_to root_path, :notice => "Successfully Send..!"
	end


	## Create Album  && Post Photo on that album

	def create_an_album
	end

	def send_album_in_facebook
		album = @me.album!(
  		:name => params[:name],
  		:message => params[:message]
		)
		redirect_to root_path, :notice => "Successfully Send..!"
	end


	## Post photo on Album

	def photo_in_album
		graph = Koala::Facebook::API.new(current_user.oauth_token)
		@albums = graph.get_connections('me', 'albums', fields: "id,name")
	end

	def send_photo_in_album
		@me.albums.each do |alb|
			s = alb.raw_attributes
			if params[:user_id] == s["id"]
				album = alb
				album.photo!(
					:access_token => current_user.oauth_token,
					:source => File.new(params[:source], 'rb'), 
					:message => params[:message]
				)
				break
			end
		end
		redirect_to root_path, :notice => "Successfully Send..!"
	end

	private

	def get_token
		token = current_user.oauth_token
		@me = FbGraph::User.me(token)
	end

end
