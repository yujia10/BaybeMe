# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#


require_relative "./create_childcares/initiate.rb"
require_relative "./create_childcares/melbourne_initiate.rb"

require "open-uri"

User.destroy_all
Child.destroy_all
# **************CHILDCARE SEEDS*********************
# create_childcares_ids
# insert_childcare_information
# add_long_alt

create_melbourne_childcares_index_file
create_melbourne_childcares_ids


# **************USER SEEDS*********************

phillip = User.create!(first_name: "Phillip", last_name: "Drummond", phone_number: "0421458844", address: "10 Janice Rd, Glen Waverley VIC 3150", email: "phillip@drummond.com", password: "secret")
alan = User.create!(first_name: "Alan", last_name: "Harper", phone_number: "0466804477", address: "256 Ferntree Gully Rd, Notting Hill VIC 3168", email: "alan@harper.com", password: "secret")

# **************CHILDREN SEEDS*********************

arnold = Child.create!(first_name: "Arnold", last_name: "Jackson", gender: 1, dob: Date.new(2020,10,12), user: phillip)
willis = Child.create!(first_name: "Willis", last_name: "Jackson", gender: 1, dob: Date.new(2019,12,29), user: phillip)
jake = Child.create!(first_name: "Jake", last_name: "Harper", gender: 1, dob: Date.new(2020,03,01), user: alan)
