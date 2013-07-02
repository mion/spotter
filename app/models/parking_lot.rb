class ParkingLot < ActiveRecord::Base
  attr_accessible :address, :spots_total, :spots_current, :pricing, :schedule

  belongs_to :user

  def self.search(params)
    if params
        find(:all, conditions: ['address LIKE ?', "%#{params}%"])
    else
        find(:all)
    end
  end
end
