class Customer < ActiveRecord::Base
  attr_accessible :birth_date, :email, :mobile_number, :name,
                  :address_attributes

  validates_presence_of :name, :email

  belongs_to :address
  has_many :vehicles
  has_many :orders

  accepts_nested_attributes_for :address, allow_destroy: true
end
