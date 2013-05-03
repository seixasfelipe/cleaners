# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    closed false
    order_date DateTime.new
    value 50.0
    
    vehicle
  end

  trait :with_items do 
    after :build do |order|
      order.items = [1,2,3].map { |i| FactoryGirl.create :item }
    end

    after :create do |order|
      order.items = [1,2,3].map { |i| FactoryGirl.create :item }
    end
  end
end
