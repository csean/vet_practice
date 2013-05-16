# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Veterinary.create( [ {
  name: "Sean Stowers",
  address: "123 Sesame Street",
  city: "Midland",
  state: "TX",
  zip: "79703",
  school: "Texas Tech University",
  date_graduated: "2005"
  },
  {
  name: "Bob Smith",
  address: "987 Crawford Ln",
  city: "Odessa",
  state: "TX",
  zip: "79710",
  school: "Texas A&M",
  date_graduated: 1985
  },
  {
  name:  "Susan Schmidt",
  address: "456 Hickory Blvd",
  city: "Midland",
  state: "TX",
  school:  "University of Texas",
  date_graduated: 1970
}])

Pet.create( {
  name: "Baron",
  species: "dog",
  breed: "Doberman",
  dob: 2009-04-27,
  weight: 100
})