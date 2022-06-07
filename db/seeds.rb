# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Department.create(name: 'окулист')

User.create(email: 'user@bit.com', phone: '0933406221', password: '123123', password_confirmation: '123123', first_name: 'Ivan', last_name: 'Ivanov', gender: 'male', birthday: '1990-01-01', user_role: 'user', department_id: nil)
User.create(email: 'doctor@bit.com', phone: '0933406222', password: '123123', password_confirmation: '123123', first_name: 'Ivan', last_name: 'Ivanov', gender: 'male', birthday: '1990-01-01', user_role: 'doctor', department_id: 1)
User.create(email: 'admin@bit.com', phone: '0933406223', password: '123123', password_confirmation: '123123', first_name: 'Ivan', last_name: 'Ivanov', gender: 'male', birthday: '1990-01-01', user_role: 'admin', department_id: nil)

