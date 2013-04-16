class Address < ActiveRecord::Base
  attr_accessible :city, :district, :street, :zip_code,
                  :state, :state_id

  belongs_to :state
end
