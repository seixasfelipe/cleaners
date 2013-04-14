class Order < ActiveRecord::Base
  attr_accessible :order_date, :value, :closed, :vehicle_id

  validates_presence_of :order_date, :vehicle_id

  validates_inclusion_of :closed, :in => [true, false]

  has_one :vehicle
end
