# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    name "MyString"
    email "MyString"
    birth_date ""
    mobile_number "MyString"
  end
end
