class Order < ActiveRecord::Base
  attr_accessible :order_date, :value, :closed, :vehicle_id, :closed_at
  
  validates_presence_of :order_date, :vehicle, :items
  validates_inclusion_of :closed, :in => [true, false]

  belongs_to :vehicle
  has_and_belongs_to_many :items

  def total
    (items.map { |i| i.price }).inject { |sum, p| sum + p }
  end

end
