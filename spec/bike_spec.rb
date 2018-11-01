require "bike.rb"

describe Bike do
	it { should respond_to(:working?) }

	it "can be report broken" do
		subject.report_broken
		expect(subject.broken?).to eq true
	end

	it "bike will not pass working? if reported broken" do
		something = Bike.new
		something.report_broken
		expect(something.working?).to eq false
	end

end