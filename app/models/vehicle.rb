class Vehicle < ActiveRecord::Base
  attr_accessible :brand, :color, :license_plate, :model

  validates :license_plate, :presence => true

  belongs_to :customer
end
