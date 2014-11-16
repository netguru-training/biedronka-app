# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

cities = %w[Warsaw Rzeszow Poznan Krakow Wroclaw Gdansk]

company_names = %w[Lidl Biedronka Tesco]
company_desc = ["Lidl jest tani", "Codziennie niskie ceny", "Duzo, tanio Tesco"]

products_names = ["Bread", "Cammembert", "Apple juice", "Mineral water", "Beer"]
products_desc = ["White bread", "Cammembert cheese", "Fresh apple juice", "Low-mineral water", "Kasztelan beer"]
images = ["bread.jpg", "cammembert.jpg", "juice.jpg", "mineral.jpg", "beer.jpg"]
streets = %w[Krakowska Warszawska Pilsudskiego Dluga Cicha Dabrowskiego]

6.times do |n|
  name = cities[n]
  City.create!(name: name)
end

3.times do |n|
  name = company_names[n]
  desc = company_desc[n]
  Company.create!(name: name, description: desc)
end

3.times do |n|
  name = company_names[n]
  6.times do |nn|
    name += " " + cities[nn]
    address = streets[nn] + rand(0..200).to_s
    desc = company_names[n] + " - " + company_desc[n]
    city_id = nn + 1
    network_id = n + 1
    Shop.create!(name: name, address: address, description: desc, city_id: city_id, company_id: network_id)
  end
end

5.times do |n|
  name = products_names[n]
  desc = products_desc[n]
  base_price = rand(0..50).to_s + "." + rand(0..100).to_s
  category = "Food"
  Product.create!(name: name, base_price: base_price, description: desc,shop_id: shop_id, category: category)
end

5.times do |n|
  divider = n + 1
  start_date = DateTime.new(2014, 12, 30%divider  + 1, 10, 12, 00)
  end_date = DateTime.new(2014, 12, 30, 23, 59, 59)
  desc = "Cheaper products 4all"
  name = "Food promotions"
  product_id = n + 1
  modifier = 0 + rand(1..50)
  Promotion.create!(start_date: start_date, end_date: end_date, name: name, description: desc, product_id: product_id, modifier: modifier)
end

5.times do |n|
  product_id = n + 1
  shop_id = rand(1..17)
  ShopProduct.create!(product_id: product_id, shop_id: shop_id)
end


User.new(
  first_name: 'Jan',
  last_name: 'Kowalski',
  email: 'jan.kowalski@gmail.com',
  password: '12345678',
  password_confirmation: '12345678',
  admin: true
).save

User.new(
  first_name: 'Janusz',
  last_name: 'Nowak',
  email: 'janusz.nowak@gmail.com',
  password: '12345678',
  password_confirmation: '12345678',
  admin: false
).save

User.new(
  first_name: 'Nick',
  last_name: 'Down',
  email: 'nick.down@gmail.com',
  password: '12345678',
  password_confirmation: '12345678',
  admin: false
).save
