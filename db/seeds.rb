# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

a = Employee.new(name: 'admin',address: 'admin_address', start_date: '2022-02-24', contact: '9849871430', role: 'admin', email: 'admin@gmail.com', password: 'admin1234')
a.save