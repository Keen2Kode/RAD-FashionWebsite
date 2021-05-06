# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create(name: "Jeff Shirt", description: "Why does it have Channing Tatum's face all over it", 
image_link: "", price: 69.0, arrival_date: Date.new(2010,2,25)) 
Item.create(name: "Reuben Shirt", description: "Brown for the indian vibes", 
image_link: "", price: 33.0, arrival_date: Date.new(2010,2,25))
Item.create(name: "Mitch Shirt", description: "Just.... white", 
image_link: "", price: 79.0, arrival_date: Date.new(2021,4,25)) 

User.create(name: "RAD", email: "rad2021rmit@gmail.com", password: "Rails2021")
User.create(name: "reuben", email: "r@e.com", password: "Rails2022")
User.create(name: "jeff", email: "b@g.com", password: "Rails2023")

BagItem.create(item_id: 1, user_id: 1, size: "extra_large", colour: "blue", quantity: 3)
BagItem.create(item_id: 2, user_id: 2, size: "small", colour: "brown", quantity: 15)
BagItem.create(item_id: 3, user_id: 3, size: "large", colour: "blue", quantity: 2)
# a copy with different quantity will still work, but only one record
BagItem.create(item_id: 2, user_id: 2, size: "small", colour: "brown", quantity: 200)


CollectionItem.create(item_id: 1, category: 0)
CollectionItem.create(item_id: 2, category: 1)
CollectionItem.create(item_id: 2, category: 2)
CollectionItem.create(item_id: 2, category: 0)
CollectionItem.create(item_id: 3, category: 2)
CollectionItem.create(item_id: 3, category: 0)