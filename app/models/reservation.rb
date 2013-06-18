class Reservation < ActiveRecord::Base
  attr_accessible :credit_card, :starts_at, :ends_at, :price
end
