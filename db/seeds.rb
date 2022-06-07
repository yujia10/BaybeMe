# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
Childcare.destroy_all
User.destroy_all
Child.destroy_all
# **************CHILDCARE SEEDS*********************

greenwood = URI.open("https://res.cloudinary.com/dxu35uhgf/image/upload/v1654567325/pqwjz2j42konkddxdsdr.jpg")
description1 = "See where the extraordinary happens at Greenwood Notting Hill. Our early learning and long day care centre."
childcare1 = Childcare.new(name: "Greenwood", email: "greenwood@greenwood.com.au", address: "16 Ferntree Place, Notting Hill 3168" , url: "https://www.greenwood.com.au/notting-hill", description: description1)
childcare1.photo.attach(io: greenwood, filename: "Greenwood.jpg", content_type: "image/jpg")
childcare1.save!

# **************USER SEEDS*********************

phillip = User.create!(first_name: "Phillip", last_name: "Drummond", phone_number: "0421458844", address: "10 Janice Rd, Glen Waverley VIC 3150", email: "phillip@drummond.com", password: "secret")
alan = User.create!(first_name: "Alan", last_name: "Harper", phone_number: "0466804477", address: "256 Ferntree Gully Rd, Notting Hill VIC 3168", email: "alan@harper.com", password: "secret")

# **************CHILDREN SEEDS*********************

arnold = Child.create!(first_name: "Arnold", last_name: "Jackson", gender: 1, dob: Date.new(2020,10,12), user: phillip)
willis = Child.create!(first_name: "Willis", last_name: "Jackson", gender: 1, dob: Date.new(2019,12,29), user: phillip)
jake = Child.create!(first_name: "Jake", last_name: "Harper", gender: 1, dob: Date.new(2020,03,01), user: alan)
