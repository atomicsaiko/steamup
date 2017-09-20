# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.destroy_all
Admin.create!(email: "admin@steamup.com", password: "abcd1234")

Student.destroy_all
Student.create!(email: "kevin@steamup.com", password: "abcd1234")
Student.create!(email: "eva@steamup.com", password: "abcd1234")
Student.create!(email: "jan@steamup.com", password: "abcd1234")
Student.create!(email: "megan@steamup.com", password: "abcd1234")
Student.create!(email: "mimi@steamup.com", password: "abcd1234")
Student.create!(email: "marloes@steamup.com", password: "abcd1234")
Student.create!(email: "job@steamup.com", password: "abcd1234")
Student.create!(email: "willem@steamup.com", password: "abcd1234")
Student.create!(email: "deborah@steamup.com", password: "abcd1234")
Student.create!(email: "faisal@steamup.com", password: "abcd1234")
Student.create!(email: "tristan@steamup.com", password: "abcd1234")
Student.create!(email: "matthijs@steamup.com", password: "abcd1234")

Studentpair.destroy_all
Studentpair.create!(student1: 11, student2: 9, date: Date.iso8601('2017-09-19'))
Studentpair.create!(student1: 11, student2: 10, date: Date.iso8601('2017-09-20'))
Studentpair.create!(student1: 11, student2: 8, date: Date.iso8601('2017-09-18'))
