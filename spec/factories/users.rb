# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence( :email ) { |n| "email_#{n}@test.com" }
  sequence( :name ) { |n| "Name_#{n}" }

  factory :user do
    first_name { FactoryGirl.generate :name }
    last_name  { FactoryGirl.generate :name }
    email      { FactoryGirl.generate :email }
    username   { FactoryGirl.generate :name }
    password   "foobarez"
    password_confirmation { |user| user.password }
  end
end
