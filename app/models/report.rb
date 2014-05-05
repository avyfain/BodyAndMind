class Report < ActiveRecord::Base
	attr_accessible :sleep, :wake, :excercise, :energy, :mood, :weight, :stress, :weather, :temperature, :geolocation
end
