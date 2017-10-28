require_relative  "bike"

class DockingStation


DEFAULT_CAPACITY = 20

attr_reader :available, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @available = []
    @working_bikes = []
    @capacity = capacity
  end


  # Consider if the empty? function of in-built Ruby
  # don't conflict with our empty? method if we were to check something is empty?
  # inside the class.

  def release_bike
    raise "There are no bikes docked" unless empty?
    raise "Remaining #{@available.length} #{@available.length > 1 ? "bikes are broken" : "bike is broken"}" unless any_working?
    @available.pop
  end



  def dock(bike)
    raise "Dock is full" if full?
    bike ? @available << bike : @available << "broken"
    p "CHECKING ARRAY", @available
  end

  private

  def any_working?
    @available.sort_by!{ |x| x.is_a?(String) ? 0 : 1 }
    @available[-1] != "broken"
  end

  def full?
    @capacity.nil? ? @available.length >= DEFAULT_CAPACITY : @available.length >= @capacity
  end

  def empty?
    @available.length > 0
  end

end
