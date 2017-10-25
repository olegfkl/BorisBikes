require 'Docking_station.rb'

describe DockingStation do
it {is_expected.to be_a(DockingStation)}

it { is_expected.to respond_to(:release_bike) }


it 'create a bike' do
      expect(subject.release_bike).to be_instance_of(Bike)
end
it 'release working bikes' do
  bike=subject.release_bike
  expect(bike).to be_working
end


it {is_expected.to respond_to(:dock).with(1).argument}

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
end
