class PlacesController < ApplicationController
	def near_by_place
		user = current_user
		unless request.get?
			lat_lng = Geocoder.coordinates(params[:city]) if params[:city].present?
			if params[:place].present? && lat_lng.present?
				@places = FbGraph::Place.search(params[:place], :center => "#{lat_lng.first}, #{lat_lng.last}", :distance => 2000, :access_token => user.oauth_token)
			else
				@places = ""				
			end
		end
	end
end
