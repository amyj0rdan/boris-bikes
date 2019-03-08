require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(our_bike)
    fail "Docking station full" if full?
    @bikes.push(our_bike)
    @bikes
  end

  def full?
    @bikes.count == 20
  end

  def empty?
    @bikes.empty?
  end

end
