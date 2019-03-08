require_relative 'bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' unless @bikes.count > 0
    @bikes.pop
  end

  def dock(our_bike)
    fail "Docking station full" if @bikes.count == 20
    @bikes.push(our_bike)
    @bikes
  end

end
