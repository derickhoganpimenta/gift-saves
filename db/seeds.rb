# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
=begin
Continent.create(name: "North America")
continent = Continent.first
continent.countries.create(name: "United States of America")
country = Country.first
country.states.create(name: "Alabama", short_name: "AL")
country.states.create(name: "Alaska", short_name: "AK")
country.states.create(name: "Arizona", short_name: "AZ")
country.states.create(name: "Arkansas", short_name: "AR")
country.states.create(name: "California", short_name: "CA")
country.states.create(name: "Colorado", short_name: "CO")
country.states.create(name: "Connecticut", short_name: "CT")
country.states.create(name: "Delaware", short_name: "DE")
country.states.create(name: "Florida", short_name: "FL")
country.states.create(name: "Georgia", short_name: "GA")
country.states.create(name: "Hawaii", short_name: "HI")
country.states.create(name: "Idaho", short_name: "ID")
country.states.create(name: "Illinois", short_name: "IL")
country.states.create(name: "Indiana", short_name: "IN")
country.states.create(name: "Iowa", short_name: "IA")
country.states.create(name: "Kansas", short_name: "KS")
country.states.create(name: "Kentucky", short_name: "KY")
country.states.create(name: "Louisiana", short_name: "LA")
country.states.create(name: "Maine", short_name: "ME")
country.states.create(name: "Maryland", short_name: "MD")
country.states.create(name: "Massachussetts", short_name: "MA")
country.states.create(name: "Michigan", short_name: "MI")
country.states.create(name: "Minessonta", short_name: "MN")
country.states.create(name: "Mississippe", short_name: "MS")
country.states.create(name: "Missouri", short_name: "MO")
country.states.create(name: "Montana", short_name: "MT")
country.states.create(name: "Nebraska", short_name: "NE")
country.states.create(name: "Nevada", short_name: "NV")
country.states.create(name: "New Hampshire", short_name: "NH")
country.states.create(name: "New Jersey", short_name: "NJ")
country.states.create(name: "New Mexico", short_name: "NM")
country.states.create(name: "New York", short_name: "NY")
country.states.create(name: "North Carolina", short_name: "NC")
country.states.create(name: "North Dakota", short_name: "ND")
country.states.create(name: "Ohio", short_name: "OH")
country.states.create(name: "Oklahoma", short_name: "OK")
country.states.create(name: "Oregon", short_name: "OR")
country.states.create(name: "Pennsylvania", short_name: "PA")
country.states.create(name: "Rhode Island", short_name: "RI")
country.states.create(name: "South Carolina", short_name: "SC")
country.states.create(name: "South Dakota", short_name: "SD")
country.states.create(name: "Tennessee", short_name: "TN")
country.states.create(name: "Texas", short_name: "TX")
country.states.create(name: "Utah", short_name: "AL")
country.states.create(name: "Alabama", short_name: "UT")
country.states.create(name: "Vermont", short_name: "VT")
country.states.create(name: "Virginia", short_name: "VA")
country.states.create(name: "Washington", short_name: "WA")
country.states.create(name: "West Virginia", short_name: "WV")
country.states.create(name: "Wisconsin", short_name: "WI")
country.states.create(name: "Wyoming", short_name: "WY")
=end
county = County.create(name: "County test")
city = City.create(name: "New York")
cc = CountyCity.new
cc.city = city
cc.county = county
cc.save
