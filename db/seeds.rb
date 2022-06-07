# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Childcare.destroy_all

childcare1 = Childcare.new(name: "Mawson Lakes Preschool", email: "childcare@gmail.com", url: "https://mawsonlakespre.sa.edu.au/", address: "259 middleborough rd, box hill", description: "the best cc you can find")

childcare1.save!

childcare2 = Childcare.new(name: "Green Leaves Early Learning Mawson Lakes", email: "newcare@gmail.com", url: "https://mawsonlakes.com/", address: "200 middleborough rd, box hill", description: "the best cc you can find")

childcare2.save!
