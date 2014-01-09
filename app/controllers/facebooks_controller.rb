class FacebooksController < ApplicationController

	## Post on Wall
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

end
