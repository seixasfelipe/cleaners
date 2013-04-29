# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence( :license_plate ) { |n| "XYZ#{n}#{n}#{n}#{n}" }
  sequence( :model ) { |n| "model_#{n}" }
  sequence( :color ) { |n| "color_#{n}" }
  sequence( :brand ) { |n| "brand_#{n}" }

  factory :vehicle do
    license_plate { FactoryGirl.generate :license_plate }
    model { FactoryGirl.generate :model }
    color { FactoryGirl.generate :color }
    brand { FactoryGirl.generate :brand }
    customer { FactoryGirl.build(:customer) }
  end
end
