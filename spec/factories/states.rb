# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :state do
    name { FactoryGirl.generate :name }
    abbreviation { FactoryGirl.generate :name }
    country
  end
end
