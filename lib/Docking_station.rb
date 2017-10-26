require_relative './bike.rb'
class DockingStation
  attr_reader:bike

  def release_bike
    raise "There are no bikes docked" unless @bike
    Bike.new
  end

  def dock(bike)
   @bike=bike
   # we use an instance variable to store the bike we dock
  end

end
