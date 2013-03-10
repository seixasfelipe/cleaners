class Task < ActiveRecord::Base
  attr_accessible :name, :price, :active

  scope :actives,  where(active: true)

  validates_presence_of :name, :price

  validates_inclusion_of :active, :in => [true, false]

  def destroy
    update_attributes(active: false) if active
  end
end
