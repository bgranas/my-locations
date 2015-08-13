class Location < ActiveRecord::Base

	acts_as_list

	#reverse_geocoded_by :latitude, :longitude, => :name
	#after_validation :reverse_geocode

	scope :sorted, lambda { order("locations.position DESC") }
	scope :most_recent, lambda { order("location.position DESC").limit(1) }
	#scope :newest_first, lambda { order{"locations.created_at DESC"} }

end
