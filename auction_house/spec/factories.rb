require 'faker'

FactoryGirl.define do  
  factory :user do
    username Faker::Internet.user_name
    
    factory :auctioneer do
      type "auctioneer"
    end
    
    factory :participant do
      type "participant"
    end
  end
  
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
    bidder FactoryGirl.build(:participant)
  end
end