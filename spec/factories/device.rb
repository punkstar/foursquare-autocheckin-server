FactoryGirl.define do
  factory :device do |f|
    f.name "My Device Name"

    f.sequence(:mac_address) { |n| "b8:e8:56:40:88:#{n}" }
  end
end
