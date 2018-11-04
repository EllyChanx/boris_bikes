require "garages.rb"

describe Garages do

  let(:bike) { double :bike }

  it "" do
    something = Bike.new
    expect(subject.fix_bike(something)).to eq true
  end

end