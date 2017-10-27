require_relative  "bike"

class DockingStation


DEFAULT_CAPACITY = 20

attr_reader :available, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @available = []
    @capacity = capacity
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
    @capacity.nil? ? @available.length >= DEFAULT_CAPACITY : @available.length >= @capacity
  end

  def empty?
    @available.length > 0
  end

end
