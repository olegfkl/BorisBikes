require_relative './bike.rb'
class DockingStation
  attr_reader:bikes

  def initialize
    @available = []
  end

  def release_bike
    raise "There are no bikes docked" unless @available.length>0
    @available.pop
  end

  def dock(bike)
    @bikes=bike
    p "checking if bike", bike
    p "checking array available length", @available.length
    raise "Dock is full" if @available.length >= 20

    p "AFTER RAISE:checking array available length", @available.length
    @available << bike
    p "PRINT ARRAY:", @available
    p "LENGTH ARRAY", @available.length
   #we use an instance variable to store the bike we dock
  end

end
