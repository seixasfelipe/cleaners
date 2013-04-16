class Country < ActiveRecord::Base
  attr_accessible :abbreviation, :name

  validates :name, :presence => true

  has_many :states
end
