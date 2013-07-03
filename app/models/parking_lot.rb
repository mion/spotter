class ParkingLot < ActiveRecord::Base
  attr_accessible :address, :spots_total, :spots_current, :pricing, :schedule, :latitude, :longitude

  acts_as_gmappable

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  belongs_to :user

  def self.search(params)
    if params
      near(params, 1, :order => :distance)
    else
      find(:all)
    end
  end

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    self.address
  end

  def spots_available
    spots_total - spots_current
  end
end
