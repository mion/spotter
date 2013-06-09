class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, 
                  :last_name, 
                  :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_uniqueness_of :email, case_sensitive: false

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
