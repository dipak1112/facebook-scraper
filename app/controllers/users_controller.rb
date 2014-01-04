class UsersController < ApplicationController
	def facebook_profile
	end

	def facebook_friends
		@my_friends = current_user.my_friends
	end
	
	def facebook_groups
		@my_groups = current_user.my_groups
	end

	def facebook_group_member
		@group = current_user.my_groups.find(params[:group_id])
		@group_members = @group.group_members.page(params[:page]).per(100)
	end

	def profile
		 @profile = Profile.find_by_fbid(params[:fbid])
	end


end
