# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name { FactoryGirl.generate :name }
    price 1.5
    active true
  end
end
