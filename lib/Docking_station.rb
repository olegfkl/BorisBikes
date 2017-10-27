require 'bike'

class DockingStation


DEFAULT_CAPACITY = 20

attr_reader :available




  def initialize
    @available = []
  end

  def release_bike
    raise "There are no bikes docked" unless empty?
    @available.pop
  end

  def dock(bike)
    raise "Dock is full" if full?
    @available << bike
  end

  private


  def full?
    @available.length >= DEFAULT_CAPACITY ? true : false
  end

  def empty?
    @available.length > 0 ? true : false
  end

end
