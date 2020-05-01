# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create! :name => 'John Peacehead', :email => 'john@greenpeace.com', :password => 'topsecret', :password_confirmation => 'topsecret'
org = Organisation.create! name: "greenpeace", location: "Cleveland", mission: "To serve the greenies of Cleveland, environment first and all that, stop the buring river, man!", owner_id:user.id
events = Event.create! [{name: "greenpeace monday event", date:"27/04/2020 19:00", location: "Downtown Cleveland RSA", organisation_id: org.id}, {name: "greenpeace friday event", date:"01/05/2020 19:00", location: "Downtown Cleveland RSA", organisation_id: org.id} ]

volunteer = User.create! :name => 'Carol Peacehead', :email => 'carol@gmail.com', :password => 'password', :password_confirmation => 'password'
volunteer2 = User.create! :name => 'Rob Peacehead', :email => 'rob@gmail.com', :password => 'password', :password_confirmation => 'password'



