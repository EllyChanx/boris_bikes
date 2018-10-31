require_relative "bike"

class DockingStation

	attr_reader :bike
	#def bike
	#	@abike # when a bike is docked, have a bike in station
	#end
	#method that used to only call the initialized var., can use atr_reader

	def release_bike
		Bike.new
	end

	
	def dock(bike) # this acts like initilize
		@bike = bike
	end



end

