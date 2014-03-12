require 'faker'

FactoryGirl.define do
  factory :user, aliases: [:buyer] do |f|
    password = Faker::Lorem.characters 12

    f.sequence(:email) { |n| "#{n}" + Faker::Internet.email }

    f.password              password
    f.password_confirmation password
  end
end
