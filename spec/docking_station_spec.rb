require 'Docking_station.rb'

describe DockingStation do
  subject(:docking_station) { described_class.new }

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

  it "docks something" do
    bike=Bike.new
    # We want to return the bike we dock
    expect(subject.dock(bike)).to eq bike
  end

  it "returns docked bikes" do
    bike=Bike.new
    subject.dock(bike)
    # return the bike we just docked
    expect(subject.bike).to eq bike
  end

  it "raise an error" do
    expect { docking_station.release_bike }.to raise_error(RuntimeError,"There are no bikes docked")
  end
end
