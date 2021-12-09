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

product = Product.create([
    {name:'Audifonos', code:'AU-1', price:14.09, quantity:17},
    {name:'Blusa', code:'BL-1', price:7.83, quantity:20},
    {name:'Mouse', code:'MS-1', price:23.48, quantity:17},
    {name:'Humidificador Mini', code:'HM-1', price:9.80, quantity:10},
    {name:'Audifonos', code:'AU-2', price:9.61, quantity:30, active:false}
])

order = Order.create([
    {user_id:1},
    {user_id:2}
])


order_item = OrderItem.create([
    {order_id:1, product_id:1, quantity:1},
    {order_id:1, product_id:2, quantity:3},
    {order_id:1, product_id:4, quantity:2},
    {order_id:2, product_id:1, quantity:2}
]) 
