class MyGroup < ActiveRecord::Base
	belongs_to :user
	has_many :group_members,:foreign_key => "group_id"
end
