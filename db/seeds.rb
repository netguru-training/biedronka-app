# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.ema

cities = %w[Warsaw Rzeszow Poznan Krakow Wroclaw Gdansk]

company_names = %w[Lidl Biedronka Tesco]
company_desc = ["Lidl jest tani", "Codziennie niskie ceny", "Duzo, tanio Tesco"]

products_names = ["Bread", "Cammembert", "Apple juice", "Mineral water", "Beer"]
products_desc = ["White bread", "Cammembert cheese", "Fresh apple juice", "Low-mineral water", "Kasztelan beer"]

6.times do |n|
  name = cities[n]
  City.create!(name: name)
end

3.times do |n|
  name = company_names[n]
  desc = company_desc[n]
  Company_Name.create!(name: name, description: desc)
end
