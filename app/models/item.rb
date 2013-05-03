class Item < ActiveRecord::Base
  attr_accessible :name, :price, :active

  scope :actives,  where(active: true)

  validates_presence_of :name, :price
  validates_inclusion_of :active, :in => [true, false]

  has_and_belongs_to_many :orders

  def destroy
    update_attributes(active: false) if active
  end
end
