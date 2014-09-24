require 'faker'

FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    price 100
  end
  
  factory :auction do
    item FactoryGirl.build(:item)
  end
  
  factory :bid do
    auction FactoryGirl.build(:auction)
    amount Random.rand(99)
    
    factory :high_bid do
      amount 105
    end
  end
end