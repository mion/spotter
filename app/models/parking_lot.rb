class ParkingLot < ActiveRecord::Base
  attr_accessible :address, :spots_total, :spots_current, :pricing, :schedule
end
