# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

a = User.new(name: 'Prajesh Shakya',address: 'Dhobighat', start_date: '2020-07-04', contact: '9849871430', role: 'admin', email: 'pj.shakya10@gmail.com', password: 'asdf1234')
a.save