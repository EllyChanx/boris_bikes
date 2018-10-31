require "docking_station.rb"

describe DockingStation do

	it { should respond_to(:release_bike)}

	it "able to call working? and return true" do
		station = DockingStation.new
		bike = station.release_bike
		expect(bike.working?).to eq true
	end

	it { is_expected.to respond_to(:dock).with(1).argument }

	it "able to dock a bike then stores it in" do
		something = Bike.new # use "DockingStation.new" works too, why Bike?
		subject.dock(something) # subject: -> x = DockingStation.new 
		expect(subject.bike).to eq something
	end
	# -- the above test removed was because def bike is removed. attr_reader :bike is used instead

end