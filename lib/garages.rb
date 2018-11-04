require_relative "bike"
require_relative "docking_station"
require_relative "van"

class Garages

  def fix_bike(bike)
    bike.report_working
    bike.working?
  end

end