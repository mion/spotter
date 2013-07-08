require 'json'

class ParkingLot < ActiveRecord::Base
  attr_accessible :name, :address, :spots_total, :spots_current, :pricing, :schedule, :latitude, :longitude

  acts_as_gmappable

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

  belongs_to :user

  def self.search(params)
    if params
      near(params, 0.5, :order => :distance)
    else
      find(:all)
    end
  end

  def gmaps4rails_address
    self.address
  end

  def spots_available
    spots_total - spots_current
  end

  def price_for_hour
    JSON.parse(pricing)
  end

  def current_price
    price_for_hour[Time.now.hour.to_s]
  end
end
