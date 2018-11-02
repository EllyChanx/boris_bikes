require_relative "bike"

class DockingStation
	
	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end
	#attr_reader :bike
	#def bike
	#	@abike # when a bike is docked, have a bike in station
	#end
	#method that used to only call the initialized var., can use atr_reader

	def release_bike 
    #Bike.new #this release a new bike, remove at step12 becoz only release if we have bike
		fail "no bike available" if empty?
    @bikes.sort.pop # if ary contains, (pop) remove the last elem. in ary
  end

	
	def dock(bike_working = true) # this acts like initilize
		fail "docking station full" if full?
		if bike_working == true
			@bikes << 1
		else bike_working == false
			@bikes << 0
		end
					
	end

private

	def full?
  	@bikes.count == @capacity
  end

  def empty?
  	!@bikes.include?(1)
  end

end

