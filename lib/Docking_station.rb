require_relative './bike.rb'
class DockingStation
  def release_bike
    Bike.new
  end

  def dock(bike)
   @bike=bike
   # we use an instance variable to store the bike we dock
  end

  attr_reader:bike

end
