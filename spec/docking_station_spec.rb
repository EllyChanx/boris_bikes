require "docking_station.rb"

describe DockingStation do

	it { should respond_to(:release_bike)}

	it { is_expected.to respond_to(:dock).with(1).argument }

	describe "#release_bike" do #nest starts

		it "able to dock a normal bike then stores it in" do 
			bike = Bike.new
			expect(subject.dock(bike)).to eq [1] #the passed arg shoud be in ary
		end

		it "able to dock a broken bike then stores it in" do 
			bike = Bike.new
			bike.report_broken
			expect(subject.dock(bike)).to eq [0] #the passed arg shoud be in ary
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

	describe 'initialization' do #nest starts

		let(:bike) { Bike.new }

	 	it "set capacity when use DockingStation.new, default if no input" do
	 	 	expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	 	end

	  it 'defaults capacity' do
	    described_class::DEFAULT_CAPACITY.times do
	      subject.dock(bike)
	    end
	    expect{ subject.dock(bike) }.to raise_error 'docking station full'
	  end

	 	it { expect(DockingStation).to respond_to(:new).with(1).argument }
	 	 	# this test the DockingStation needs 1 argument to be given when used
	 	 	#model ans for this test is as below
	 	it "has a variable capacity" do
	 	 			docking_station = DockingStation.new(50)
	 	 			50.times { docking_station.dock(bike)}
	 	 			expect{docking_station.dock(bike)}.to raise_error "docking station full"
	 	end
	end #nest end

 	 	it "do not realse broken bike - dork 1 broken" do
 	 		bike = Bike.new
 	 		bike.report_broken
 	 		subject.dock(bike)
 	 		expect{subject.release_bike}.to raise_error "no bike available"
 	 	end

 	 	it "release working bike - dork 1 working 1 broken" do
 	 		bike0 = Bike.new
 	 		subject.dock(bike0)
 	 		bike1 = Bike.new
 	 		bike1.report_broken
 	 		subject.dock(bike1)
 	 		expect(subject.release_bike).to eq 1 #pop return the poped value

 	 	end

 	 	it "do not realse broken bike - dork 1 working 1 broken " do
 	 		bike0 = Bike.new
 	 		subject.dock(bike0)
 	 		bike1 = Bike.new
 	 		bike1.report_broken
 	 		subject.dock(bike1)
 	 		subject.release_bike
 	 		expect{subject.release_bike}.to raise_error "no bike available"
 	 	end

end