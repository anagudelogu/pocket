# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

u1 = User.new(name: 'Andres', email: 'andres@asd.com', password: '123456')
u1.skip_confirmation!
u1.save

u2 = User.new(name: 'Test', email: 'test@asd.com', password: '123456')
u2.skip_confirmation!
u2.save

# User 1 Categories

Category.create(user: u1, name: 'Living', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
Category.create(user: u1, name: 'Entertainment', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
Category.create(user: u1, name: 'Food', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
Category.create(user: u1, name: 'Debt', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )


# User 2 Categories

Category.create(user: u2, name: 'Living', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
Category.create(user: u2, name: 'Entertainment', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
Category.create(user: u2, name: 'Debt', icon: 'https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1' )
