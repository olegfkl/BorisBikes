require 'Docking_station.rb'

describe DockingStation do
  subject(:docking_station) { described_class.new }
  DEFAULT_CAPACITY = 20

  it { is_expected.to be_a(DockingStation) }

  it { is_expected.to respond_to(:release_bike) }

  it "create a bike" do
    bike=Bike.new
    expect(bike).to be_instance_of(Bike)
  end

  it "release working bikes" do
    bike=Bike.new
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it "returns docked bikes" do
    bike=Bike.new
    # return the bike we just docked
    expect(subject.dock(bike)).to eq [bike]
  end

  it "raise an error" do
    expect { docking_station.release_bike }.to raise_error(RuntimeError,"There are no bikes docked")
  end

  it "raises an error concerning dock station being full with default capacity" do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times{docking_station.dock(bike)}
    expect { docking_station.dock(bike) }.to raise_error("Dock is full")
  end

  it "should allow the system maintainer to enter bike capacity" do
    station = DockingStation.new(30)
    expect(station.capacity).to eq 30
  end

  it "User can report broken bike" do
     bike = Bike.new
     expect(docking_station.report_broken(bike  )).to eq ("Bike has been reported broken")
  end

end
