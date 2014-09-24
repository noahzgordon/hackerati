FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    price 100
  end