# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    price 100
  end
end
