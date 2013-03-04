# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name { FactoryGirl.generate :name }
    email { FactoryGirl.generate :email }
    birth_date DateTime.new
    mobile_number "555-5555"
  end
end
