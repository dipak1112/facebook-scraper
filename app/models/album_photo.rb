class AlbumPhoto < ActiveRecord::Base
	belongs_to :album
	has_many :tags, :as => :mixable
	has_many :likes, :as => :mixable
	has_many :comments, :as => :mixable
end
