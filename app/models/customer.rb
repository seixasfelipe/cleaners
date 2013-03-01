class Customer < ActiveRecord::Base
  attr_accessible :birth_date, :email, :mobile_number, :name
end
