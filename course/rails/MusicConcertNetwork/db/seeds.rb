# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Concert.create(band:"Pink Floyd", venue:"Pyramids", city:"El Cairo", date:Date.today, price:3, description: "Chilled")
Concert.create(band:"Sepultura", venue:"Eiffel", city:"Paris", date:Date.today, price:17, description: "Die with honor")
Concert.create(band:"Kraken", venue:"Orquideorama", city:"Medellin", date:Date.today, price:1, description: "Release the kraken!!!")