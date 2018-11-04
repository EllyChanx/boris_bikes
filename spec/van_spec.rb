require "van.rb"

describe Van do
  let(:bike) { double :bike }

  it "takes working bike and stores in van" do
    allow(bike).to receive(:working?).and_return(true)
    subject.take_bike(bike)
    expect(subject.van_bikes).to eq [1]
  end

  it "takes broken bikes and stores in van" do
    allow(bike).to receive(:working?).and_return(false)
    subject.take_bike(bike)
    expect(subject.van_bikes).to eq [0]
  end 

  it "raise error when van is full" do
    allow(bike).to receive(:working?).and_return(true||false)
    Van::VANCAP_DEFAULT.times {subject.take_bike(bike)}
    expect{ subject.take_bike(bike) }.to raise_error "van is full"
  end

end