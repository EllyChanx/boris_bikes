require "bike.rb"

describe Bike do
	it { should respond_to(:working?) }

	it "can be report broken" do
		subject.report_broken
		expect(subject.broken).to eq true
	end

	it "bike is working-true if no reports" do
		expect(subject.working?).to eq true
	end

	it "bike is working-false if reported" do
		subject.report_broken
		expect(subject.working?).to eq false
	end

end