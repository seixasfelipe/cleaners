class Vehicle < ActiveRecord::Base
  attr_accessible :brand, :color, :license_plate, :model, :customer_id

  validates :license_plate, :presence => true
  validates_presence_of :customer

  belongs_to :customer
  has_many :orders

  def to_label
    "#{license_plate}"
  end
end
