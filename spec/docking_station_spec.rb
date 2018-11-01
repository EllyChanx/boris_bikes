require "docking_station.rb"

describe DockingStation do

	it { should respond_to(:release_bike)}

	#it "able to call working? and return true" do
	#	station = DockingStation.new
	#	bike = station.release_bike
	#	expect(bike.working?).to eq true
	#end

	it { is_expected.to respond_to(:dock).with(1).argument }

	describe "#release_bike" do # nested because describing behaviour specific to a particular method
		it "able to dock a bike then stores it in" do
			something = Bike.new # use "DockingStation.new" works, why pass Bike class?
			subject.dock(something) # subject: -> x = DockingStation.new 
			expect(subject.bikes).to eq [something] #the passed arg shoud be in ary
		end

		it "show error when no bike is docked in station" do
    	expect {subject.release_bike}.to raise_error "no bike available"
 	 	end
 	end #nesting end

 		it "if already have bike, return error when dock bike" do
 			DockingStation::DEFAULT_CAPACITY.times do
 				subject.dock(Bike.new) # either Bike or DockingStation, this is a var that runs in the class not method
 			end # use "DockingStation.new" works, why pass Bike class?
    	expect {subject.dock(Bike.new)}.to raise_error "docking station full"
 	 	end
 	 	#[ something = Bike.new; subject.dock(something) ] = subject.dock(Bike.new)


 	 	it "set capacity when use DockingStation.new, default if no input" do
 	 		expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
 	 	end

end