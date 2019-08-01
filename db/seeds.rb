# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = Product.create([{ name: 'Logo', price: 450 }, { name: 'Visitkort Design', price: 990 }, { name: 'Pakke Design', price: 990 } ])
packages = Package.create([{ name: 'Hobby', price: 990 }, { name: 'Grunder', price: 1490 }, { name: 'Corporate', price: 2990 }])
industries = Industry.create([{ description: 'Transportation' }, { description: 'Inspection' }])
industries = Style.create([{ name: 'one' }, { name: 'three' }])
services = Service.create([{ name: '100 % fornøydgaranti' }, { name: '10 Endringer' }, { name: '3 Endringer' }, { name: '6 Endringer' } ])
