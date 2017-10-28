require_relative  "bike"

class DockingStation


DEFAULT_CAPACITY = 20

attr_reader :available, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @available = []
    @working_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes docked" unless empty?
    @available.sort_by!{ |x| x.is_a?(String) ? 0 : 1 }
    unless @available[-1] == "broken"
      @available.pop
    else
      raise "Unfortunately the remaining #{@available.length} bike(s) are broken"
    end
  end

  def dock(bike)
    raise "Dock is full" if full?
    # p "REPORT:: report bike broken", bike.report_broken
    # p "BROKEN? is bike broken true?", bike.broken?
    bike ? @available << bike : @available << "broken"
    p "CHECKING ARRAY", @available
        # @working_bikes << bike
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
