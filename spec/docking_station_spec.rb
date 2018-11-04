require "docking_station.rb"

describe DockingStation do

	let(:bike) { double :bike }

	it { should respond_to(:release_bike)}

	it { is_expected.to respond_to(:dock).with(1).argument }

	describe "#release_bike" do #nest starts
		it "able to dock a normal bike then stores it in" do 
			#bike = Bike.new
			allow(bike).to receive(:working?).and_return(true)
			expect(subject.dock(bike)).to eq [1] #the passed arg shoud be in ary
		end

		it "able to dock a broken bike then stores it in" do 
			#bike = Bike.new
			#bike.report_broken
			allow(bike).to receive(:working?).and_return(false)
			expect(subject.dock(bike)).to eq [0] #the passed arg shoud be in ary
		end

		it "show error when no bike is docked in station" do
	    	expect {subject.release_bike}.to raise_error "no bike available"
	 	end
 	end #nesting end

 	it "if already have bike, return error when dock bike" do
 		allow(bike).to receive(:working?).and_return(true||false)
 		DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
    expect {subject.dock(bike)}.to raise_error "docking station full"
 	end

	describe 'initialization' do #nest starts
	 	it "set capacity when use DockingStation.new, default if no input" do
	 	 	expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
	 	end

	  it 'defaults capacity' do
	  	allow(bike).to receive(:working?).and_return(true||false)
	    described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
	    expect{ subject.dock(bike) }.to raise_error 'docking station full'
	  end

	 	it { expect(DockingStation).to respond_to(:new).with(1).argument }
	 	 	# this test the DockingStation needs 1 argument to be given when used
	 	 	#model ans for this test is as below
	 	it "has a variable capacity" do
	 		allow(bike).to receive(:working?).and_return(true||false)
	 	 	docking_station = DockingStation.new(50)
	 	 	50.times { docking_station.dock(bike) }
	 	 	expect{ docking_station.dock(bike) }.to raise_error "docking station full"
	 	end
	end #nest end

  it "do not realse broken bike - dork 1 broken" do
 	 	allow(bike).to receive(:working?).and_return(false)
		#bike.report_broken
 		subject.dock(bike)
 		expect{ subject.release_bike }.to raise_error "no bike available"
 	end

	let (:bike0) {double :bike0}
	let (:bike1) {double :bike1}
	it "release working bike - dork 1 working 1 broken" do
		allow(bike0).to receive(:working?).and_return(true)
		allow(bike1).to receive(:working?).and_return(false)
 		subject.dock(bike0)	
 		subject.dock(bike1)
 		expect(subject.release_bike).to eq 1 #pop return the poped value
 	end

 	 	it "do not realse broken bike - dork 1 working 1 broken " do
			allow(bike0).to receive(:working?).and_return(true)
			allow(bike1).to receive(:working?).and_return(false)
 	 		subject.dock(bike0)
 	 		subject.dock(bike1)
 	 		subject.release_bike
 	 		expect{subject.release_bike}.to raise_error "no bike available"
 	 	end

		it 'releases working bikes' do
  		allow(bike).to receive(:working?).and_return(true)
  		subject.dock(bike)
  		released_bike = subject.release_bike
  		expect(released_bike).to eq 1
		end
end