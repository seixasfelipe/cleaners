class Order < ActiveRecord::Base
  attr_accessible :order_date, :value, :closed

  validates_presence_of :order_date, :vehicle

  validates_inclusion_of :closed, :in => [true, false]

  has_one :vehicle
end
