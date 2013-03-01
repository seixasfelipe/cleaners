class Task < ActiveRecord::Base
  attr_accessible :name, :price

  validates_presence_of :name, :price
end
