require_relative "bike"
require_relative "van"

class DockingStation
	
	DEFAULT_CAPACITY = 20

	attr_reader :bikes, :capacity

	def initialize(capacity = DEFAULT_CAPACITY)
		@bikes = []
		@capacity = capacity
	end
	
	def release_bike 
    #Bike.new #this release a new bike, remove at step12 becoz only release if we have bike
		fail "no bike available" if empty?
    @bikes.sort!.pop # if ary contains, (pop) remove the last elem. in ary
  end

	
	def dock(bike) # this acts like initilize
		fail "docking station full" if full?
		bike.working? ? (@bikes << 1) : (@bikes << 0)
	end

private

	def full?
  	@bikes.count >= @capacity
  end

  def empty?
  	!@bikes.include?(1)
  end

end

