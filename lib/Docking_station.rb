require_relative  "bike"

class DockingStation


DEFAULT_CAPACITY = 20

attr_reader :available, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @available = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes docked" unless empty?
    @available.pop unless true
  end

  def dock(bike)
    raise "Dock is full" if full?
    # p "REPORT:: report bike broken", bike.report_broken
    # p "BROKEN? is bike broken true?", bike.broken?
    bike ? @available << bike : @available << false
    p "CHECKING ARRAY", @available
        # @broken_bikes << bike
        #   capacity - 1
        # end
  end

  private

  def full?
    @capacity.nil? ? @available.length >= DEFAULT_CAPACITY : @available.length >= @capacity
  end

  def empty?
    @available.length > 0
  end

end
