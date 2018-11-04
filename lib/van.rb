require_relative "bike"
require_relative "docking_station"
require_relative "garages"

class Van

  VANCAP_DEFAULT = 10
  attr_reader :van_bikes

  def initialize(van_capacity = VANCAP_DEFAULT)
    @van_capacity = van_capacity
    @van_bikes = []
  end

  def take_bike(bike)
    fail "van is full" if full?
    bike.working? ? (@van_bikes << 1) : (@van_bikes << 0)
  end

  def full?
    @van_bikes.count == @van_capacity
  end

end