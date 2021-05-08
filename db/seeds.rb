# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# need to get multiple messages
# https://www.myer.com.au/p/calvin-klein-solid-business-shirt-732341800-1?istCompanyId=84873db0-394f-434b-8958-29526fe5f03c&istFeedId=3dd6959f-3482-45a5-8a47-313fef9bbe16&istItemId=iimrmpprm&istBid=t&gclid=Cj0KCQjwytOEBhD5ARIsANnRjVgWC5oZr3fnhHc6PrlEVWNEW7goinmi_SIuQXWflV9uxWON-ZcCl-saAiSWEALw_wcB&gclsrc=aw.ds
item1 = Item.create(
    name: "Navy Business Shirt",
    description: "Solid Business Shirt. Navy colour",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-blue-shirt.jpeg",
    price: 89.95,
    arrival_date: Date.new(2010, 2, 25))
# https://www.myer.com.au/p/piper-short-puff-sleve-broderie-dress-white?istCompanyId=84873db0-394f-434b-8958-29526fe5f03c&istFeedId=3dd6959f-3482-45a5-8a47-313fef9bbe16&istItemId=imlampaiq&istBid=t&gclid=Cj0KCQjwytOEBhD5ARIsANnRjVjQ4taZtemegIWQh5tkspsiziAcmbhmyUA3j2RufCbVBs4Ostpv2AAaAgJGEALw_wcB&gclsrc=aw.ds
item2 = Item.create(
    name: "Broderie Dress",
    description: "Piper Short Puff Sleeve Broderie Dress White",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-white-dress.jpeg",
    price: 120.00,
    arrival_date: Date.new(2010, 2, 25))
# https://www.myer.com.au/p/tommy-hilfiger-denton-straight-chino-631205380-1
item3 = Item.create(
    name: "Straight Chino",
    description: "Tommy Hilfiger Denton Straight Chino",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-denton-straight-chino.jpeg",
    price: 149.00,
    arrival_date: Date.new(2010, 2, 25))
# https://www.myer.com.au/p/tommy-jeans-tommy-flag-cropped-sweatshirt
item4 = Item.create(
    name: "Cropped Sweatshirt",
    description: "Tommy Jeans Tommy Flag Cropped Sweatshirt. Black Iris",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-tommy-flag-cropped-sweatshirt.jpeg",
    price: 125.30,
    arrival_date: Date.new(2010, 2, 25))
# https://www.myer.com.au/p/jack-milly-issac-organic-sherpa-lined-hodie
item5 = Item.create(
    name: "Kids Lined Hoodie",
    description: "Jack & Milly Issac Organic Sherpa Lined Hoodie",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-jack-milly-issac-organic-sherpa-lined-hodie.jpeg",
    price: 34.95,
    arrival_date: Date.new(2010, 2, 25))
# https://www.myer.com.au/p/milkshake-roars-before-snores-pyjama-set
item6 = Item.create(
    name: "Kids Pyjama Set",
    description: "Milkshake Roars Before Snores Pyjama Set. Crimson colour.",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-milkshake-roars-before-snores-pyjama-set.jpeg",
    price: 25.00,
    arrival_date: Date.new(2010, 2, 25))
# Item.create(
#     name: "Jeff Shirt",
#     description: "Why does it have Channing Tatum's face all over it",
#     image_link: "",
#     price: 69.0,
#     arrival_date: Date.new(2010, 2, 25))
# Item.create(
#     name: "Reuben Shirt",
#     description: "Brown for the indian vibes",
#     image_link: "",
#     price: 33.0,
#     arrival_date: Date.new(2010, 2, 25))
# Item.create(
#     name: "Mitch Shirt",
#     description: "Just.... white",
#     image_link: "",
#     price: 79.0,
#     arrival_date: Date.new(2021, 4, 25))

user1 = User.create(name: "RAD", email: "rad2021rmit@gmail.com", password: "Rails2021")
user2 = User.create(name: "reuben", email: "r@e.com", password: "Rails2022")
user3 = User.create(name: "jeff", email: "b@g.com", password: "Rails2023")

BagItem.create(
    item_id: item1.id,
    user_id: user1.id,
    size: "extra_large",
    colour: "blue",
    quantity: 3)
BagItem.create(
    item_id: item2.id,
    user_id: user2.id,
    size: "small",
    colour: "brown",
    quantity: 15)
BagItem.create(
    item_id: item3.id,
    user_id: user3.id,
    size: "large",
    colour: "blue",
    quantity: 2)# a copy with different quantity will still work, but only one record
BagItem.create(
    item_id: item2.id,
    user_id: user2.id,
    size: "small",
    colour: "brown",
    quantity: 200)

# category: men=0, women=1, kids=2
CollectionItem.create(item_id: item1.id, category: 0)
CollectionItem.create(item_id: item2.id, category: 1)
CollectionItem.create(item_id: item3.id, category: 0)
CollectionItem.create(item_id: item4.id, category: 1)
CollectionItem.create(item_id: item5.id, category: 2)
CollectionItem.create(item_id: item6.id, category: 2)
