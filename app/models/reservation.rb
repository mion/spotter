class Reservation < ActiveRecord::Base
  attr_accessible :credit_card, :holder_name, :starts_at, :ends_at, :price, :expires_at

  belongs_to :user
end
