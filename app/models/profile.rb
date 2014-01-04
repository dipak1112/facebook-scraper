class Profile < ActiveRecord::Base
	serialize :education
	serialize :work
end
