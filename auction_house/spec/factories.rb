require 'faker'

FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    price 100
  end
  
  factory :auction do
    item FactoryGirl.build(:item)
  end
end