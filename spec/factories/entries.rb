# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry do
    ip_address "MyString"
    created_at "2014-03-13"
    device_id 1
  end
end
