# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    closed false
    order_date DateTime.new
    value 50.0
    vehicle { FactoryGirl.build(:vehicle) }
    vehicle_id 1
  end
end
