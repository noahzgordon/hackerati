Auction House
=========

A back-end library for a simulated auction house. Implemented in Ruby on Rails. All models are tested using RSpec. Features include:
+ A web of associations between Users, Items, Auctions and Bids.
+ The ability to call an auction and automatically save its status (success/failure).
+ The inability to submit bids lower than the current highest bid on an auction.
+ A query method which returns a JSON object representation of the item and its auction status.
