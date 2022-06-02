# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

iphone13 = Phone.create(name:"iPhone 13", desc:"Starting at $829 (without activation), the iPhone 13 features a new A15 Bionic chip, an OLED display, 128GB of internal storage.", price:829, image: "https://i.ibb.co/6FfrYbZ/iphone-13.png")
s22= Phone.create(name:"Samsung S22 Plus", desc:"The Galaxy S22 Plus features the latest Snapdragon chipset, an excellent 6.6-inch display, and three rear cameras.", price: 999, image: "https://i.ibb.co/JHbPtvh/s22.png")
iphone13mini = Phone.create(name:"iPhone 13 Mini", desc: "The iPhone 13 Mini has all the features and cameras of its bigger siblings, just in a smaller package.", price: 699, image: "https://i.ibb.co/CzLnX4p/iphone13mini.png")
zenphone8= Phone.create(name:"Asus Zenphone 8", desc:"For small-phone Android fans, the Asus Zenfone 8 is the perfect fit. It has a relatively tiny 5.9-inch display.", price: 649, image: "https://i.ibb.co/KhP0Wtb/zenphone8.png")
pixel6= Phone.create(name:"Google Pixel 6", desc:"The Google Pixel 6 is the new base model of Google’s latest flagship. It features the Google Tensor CPU, and 8GB of RAM.", price:599, image:"https://i.ibb.co/y6gVtDC/pixel6.png")
iphone13promax = Phone.create(name:"iPhone 13 Pro Max" ,desc: "The iPhone 13 Pro Max is a beast with an impressive camera system with the new A15 Bionic chip.", price: 1099, image:"https://i.ibb.co/ypf5pdK/iphone13-pro-max.png")

