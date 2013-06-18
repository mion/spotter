require 'test_helper'

class ParkingLotTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ParkingLot.new.valid?
  end
end
