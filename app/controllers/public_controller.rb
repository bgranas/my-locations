class PublicController < ApplicationController

	layout 'public'

	
def index
	@locations = Location.sorted
	@myip = request.remote_ip
	@current = Location.most_recent
	@hash = Gmaps4rails.build_markers(@locations) do |location, marker|
  		marker.lat location.latitude.to_f
  		marker.lng location.longitude.to_f
  		marker.title location.name
	end
end


end
