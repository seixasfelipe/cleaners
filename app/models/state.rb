class State < ActiveRecord::Base
  attr_accessible :abbreviation, :name, :country_id

  belongs_to :country

  validates :name, :country, :presence => true

  def to_label
    "#{name} - #{country.name}"
  end

  def self.order_by_name
    order :name
  end
end
