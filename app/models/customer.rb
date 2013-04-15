class Customer < ActiveRecord::Base
  attr_accessible :birth_date, :email, :mobile_number, :name

  validates_presence_of :name, :email

  has_many :vehicles
  has_many :orders
end
