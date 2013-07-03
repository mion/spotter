class Reservation < ActiveRecord::Base
  attr_accessible :credit_card, :starts_at, :ends_at, :price, :expires_at, :verify_digits

  belongs_to :user
end
