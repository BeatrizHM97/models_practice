# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create([
    {name:'Lucas', lastname:'Fernández', birth_date:'20/07/1995', email_address:'lucas@gmail.com', password:'Lk95.Fz07'},
    {name:'Briana', lastname:'Hernández', birth_date:'22/01/2000', email_address:'briana@gmail.com', password:'Bn22.Hz01'},
    {name:'Rodrigo', lastname:'Mora', birth_date:'01/09/1997', email_address:'rodrigo@gmail.com', password:'Rd97-Ma09'}
])
