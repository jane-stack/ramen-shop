# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Review.destroy_all
Comment.destroy_all

# Users
jane = User.create(username: "janeur", password: "Testing12345#")
jimmy = User.create(username: "jvng", password: "Testing12345$")
andy = User.create(username: "andy101", password: "Testing12345#")
adalyn = User.create(username: "addy", password: "Testing12345#")

# Reviews
review1 = Review.create(content: "Hand's down the best ramen in town!", user: jane )
review2 = Review.create(content: "Can't get enough! Must try!", user: jimmy )
review3 = Review.create(content: "It's so yummy!", user: andy )
review4 = Review.create(content: "If you're in town, this place a forsure must try.", user: adalyn )

# Comments
one = Comment.create(body: "I have to agree!", user: adalyn, review: review1)
one = Comment.create(body: "I second that!", user: jimmy, review: review1)
one = Comment.create(body: "It is indeed so yummy!", user: jane, review: review3)
one = Comment.create(body: "mmmm.. so tasty!", user: adalyn, review: review3)
one = Comment.create(body: "Took her advice and I'm sold for life", user: jane, review: review4)