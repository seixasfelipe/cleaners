# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    street   { FactoryGirl.generate :name }
    district { FactoryGirl.generate :name }
    city     { FactoryGirl.generate :name }
    zip_code { FactoryGirl.generate :name }
    state
  end
end
