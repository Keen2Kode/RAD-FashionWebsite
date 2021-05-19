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
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-calvin-klein-solid-business-shirt.jpeg",
    price: 89.95,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25))

# https://www.myer.com.au/p/piper-short-puff-sleve-broderie-dress-white?istCompanyId=84873db0-394f-434b-8958-29526fe5f03c&istFeedId=3dd6959f-3482-45a5-8a47-313fef9bbe16&istItemId=imlampaiq&istBid=t&gclid=Cj0KCQjwytOEBhD5ARIsANnRjVjQ4taZtemegIWQh5tkspsiziAcmbhmyUA3j2RufCbVBs4Ostpv2AAaAgJGEALw_wcB&gclsrc=aw.ds
item2 = Item.create(
    name: "Broderie Dress",
    description: "Piper Short Puff Sleeve Broderie Dress White",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-piper-short-puff-sleeve-broderie-dress-white.jpeg",
    price: 120.00,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25))
# https://www.myer.com.au/p/tommy-hilfiger-denton-straight-chino-631205380-1
item3 = Item.create(
    name: "Straight Chino",
    description: "Tommy Hilfiger Denton Straight Chino",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-denton-straight-chino.jpeg",
    price: 149.00,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25)
)
# https://www.myer.com.au/p/tommy-jeans-tommy-flag-cropped-sweatshirt
item4 = Item.create(
    name: "Cropped Sweatshirt",
    description: "Tommy Jeans Tommy Flag Cropped Sweatshirt. Black Iris",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-tommy-flag-cropped-sweatshirt.jpeg",
    price: 125.30,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25)
)
# https://www.myer.com.au/p/jack-milly-issac-organic-sherpa-lined-hodie
item5 = Item.create(
    name: "Kids Lined Hoodie",
    description: "Jack & Milly Issac Organic Sherpa Lined Hoodie",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-jack-milly-issac-organic-sherpa-lined-hodie.jpeg",
    price: 34.95,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25)
)
# https://www.myer.com.au/p/milkshake-roars-before-snores-pyjama-set
item6 = Item.create(
    name: "Kids Pyjama Set",
    description: "Milkshake Roars Before Snores Pyjama Set. Crimson colour.",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-milkshake-roars-before-snores-pyjama-set.jpeg",
    price: 25.00,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25))

# https://www.myer.com.au/p/jack-jones-globe-parka-763941880-1
item7 = Item.create(
    name: "Globe Parka",
    description: "Jack & Jones Globe Parka. Black colour.",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-jack-jones-globe-parka.jpeg",
    price: 169.95,
    popularity: rand(0...10),
    arrival_date: Date.new(2010, 2, 25)
)
# https://www.myer.com.au/p/grab-olivia-high-rise-skinny-jean-805903930-1
item8 = Item.create(
    name: "High Rise Skinny Jean",
    description: "Grab Denim Olivia High Rise Skinny Jean. Dark Wash colour.",
    image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-grab-denim-olivia-high-rise-skinny-jean.jpeg",
    price: 169.95,
    popularity: rand(0...10),
    arrival_date: Date.new(2021, 5, 10)
)
ItemImage.create(item: item1, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-calvin-klein-solid-business-shirt-2.jpeg")
ItemImage.create(item: item1, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-calvin-klein-solid-business-shirt-3.jpeg")

ItemImage.create(item: item2, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-piper-short-puff-sleeve-broderie-dress-white-2.jpeg")
ItemImage.create(item: item2, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-piper-short-puff-sleeve-broderie-dress-white-3.jpeg")
ItemImage.create(item: item2, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-piper-short-puff-sleeve-broderie-dress-white-4.jpeg")

ItemImage.create(item: item3, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-denton-straight-chino-2.jpeg")
ItemImage.create(item: item3, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-denton-straight-chino-3.jpeg")
ItemImage.create(item: item3, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-denton-straight-chino-4.jpeg")

ItemImage.create(item: item4, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-tommy-flag-cropped-sweatshirt-2.jpeg")

ItemImage.create(item: item5, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-jack-milly-issac-organic-sherpa-lined-hodie-2.jpeg")
ItemImage.create(item: item5, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-jack-milly-issac-organic-sherpa-lined-hodie-3.jpeg")

ItemImage.create(item: item6, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-milkshake-roars-before-snores-pyjama-set-2.jpeg")
ItemImage.create(item: item6, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-milkshake-roars-before-snores-pyjama-set-3.jpeg")
ItemImage.create(item: item6, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/kids-milkshake-roars-before-snores-pyjama-set-4.jpeg")   
    
ItemImage.create(item: item7, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-jack-jones-globe-parka-2.jpeg")
ItemImage.create(item: item7, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/men-jack-jones-globe-parka-3.jpeg")    
    
ItemImage.create(item: item8, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-grab-denim-olivia-high-rise-skinny-jean-2.jpeg")
ItemImage.create(item: item8, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-grab-denim-olivia-high-rise-skinny-jean-3.jpeg")
ItemImage.create(item: item8, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-grab-denim-olivia-high-rise-skinny-jean-4.jpeg")
ItemImage.create(item: item8, image_link: "https://rmit-rad.s3-ap-southeast-2.amazonaws.com/women-grab-denim-olivia-high-rise-skinny-jean-5.jpeg")











CollectionItem.create(item: item1, category: :men)
CollectionItem.create(item: item2, category: :women)
CollectionItem.create(item: item3, category: :men)
CollectionItem.create(item: item4, category: :women)
CollectionItem.create(item: item5, category: :kids)
CollectionItem.create(item: item6, category: :kids)
CollectionItem.create(item: item7, category: :men)
CollectionItem.create(item: item8, category: :women)


TagItem.create(item: item1, tag: :shirts)

TagItem.create(item: item2, tag: :dresses)

TagItem.create(item: item3, tag: :pants)

TagItem.create(item: item4, tag: :shirts)
TagItem.create(item: item4, tag: :jackets)

TagItem.create(item: item5, tag: :jackets)

TagItem.create(item: item6, tag: :jackets)
TagItem.create(item: item6, tag: :pyjamas)
TagItem.create(item: item6, tag: :shirts)
TagItem.create(item: item6, tag: :pants)

TagItem.create(item: item7, tag: :jackets)

TagItem.create(item: item8, tag: :pants)








variant1 = ItemVariant.create(item: item1, size: "extra_large", colour: "blue")
variant2 = ItemVariant.create(item: item2, size: "small", colour: "brown")
variant3 = ItemVariant.create(item: item3, size: "large", colour: "blue")

ItemVariant.create(item: item1, size: "extra_large", colour: "green")
ItemVariant.create(item: item1, size: "extra_large", colour: "green")
ItemVariant.create(item: item1, size: "small", colour: "red")
ItemVariant.create(item: item1, size: "small", colour: "green")
ItemVariant.create(item: item1, size: "small", colour: "blue")

ItemVariant.create(item: item2, size: "extra_small", colour: "blue")
ItemVariant.create(item: item2, size: "extra_small", colour: "red")
ItemVariant.create(item: item2, size: "medium", colour: "black")
ItemVariant.create(item: item2, size: "medium", colour: "brown")

ItemVariant.create(item: item3, size: "large", colour: "blue")

ItemVariant.create(item: item4, size: "extra_large", colour: "blue")
ItemVariant.create(item: item4, size: "extra_large", colour: "red")
ItemVariant.create(item: item4, size: "small", colour: "black")

ItemVariant.create(item: item5, size: "large", colour: "blue")

ItemVariant.create(item: item6, size: "large", colour: "blue")

ItemVariant.create(item: item7, size: "large", colour: "blue")


# item 5 has all variations of colour and size
colours = ItemVariant.colours.keys
sizes = ItemVariant.sizes.keys
variant = sizes.product(colours)
variant.each {|v| ItemVariant.create(item: item5, size: v[0], colour: v[1])}











user1 = User.create(name: "RAD", email: "rad2021rmit@gmail.com", password: "Rails2021")
user2 = User.create(name: "reuben", email: "r@e.com", password: "Rails2022")
user3 = User.create(name: "jeff", email: "b@g.com", password: "Rails2023")

BagItem.create(item_variant: variant1, user: user1, quantity: 3)
BagItem.create(item_variant: variant2, user: user2, quantity: 15)
BagItem.create(item_variant: variant3, user: user3, quantity: 2)
# a copy with different quantity will still work, but only one variant
BagItem.create(item_variant: variant2, user: user2, quantity: 200)
