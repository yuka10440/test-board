require 'faker'

FactoryGirl.define do
  factory :message do
    title { Faker::Book.title }
    body { Faker::Lorem.sentence }
  end
end