class User < ActiveRecord::Base

	has_many :my_friends, :dependent => :destroy
	has_many :my_groups, :dependent => :destroy
	has_many :albums, :dependent => :destroy
	
	accepts_nested_attributes_for :my_friends,	:allow_destroy => true
	accepts_nested_attributes_for :my_groups,	:allow_destroy => true

	
	serialize :employee_info
	serialize :education_history

	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.first_name = auth.info.first_name	    
			user.last_name = auth.info.last_name
			user.nickname = auth.info.nickname
			user.email =	auth.info.email
			user.image = auth.info.image
			user.locations = auth.info.location
			user.fburl = auth.info.urls			
			user.fbid 	= auth.extra.raw_info.id
			user.username = auth.extra.raw_info.username
			user.gender = auth.extra.raw_info.gender
			user.timezone = auth.extra.raw_info.timezone			
	    user.save!
	    
	  end
	end
end