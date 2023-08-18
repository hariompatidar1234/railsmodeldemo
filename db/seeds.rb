# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# admin=Admin.create(first_name:"hariom",last_name:"patidar",gmail:"hariom@123gmail.com")
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


=begin

admin=Admin.create(first_name:"hariom",last_name:"patidar",gmail:"hariom@123gmail.com")
User.create(
  first_name: "Aryan",
  last_name: "Singh",
  contact: "7654321098",
  address: "Bangalore"
)

User.create(
  first_name: "Sneha",
  last_name: "Verma",
  contact: "6543210987",
  address: "Kolkata"
)

User.create(
  first_name: "Vivek",
  last_name: "Kumar",
  contact: "5432109876",
  address: "Chennai"
)

User.create(
  first_name: "Anjali",
  last_name: "Gupta",
  contact: "4321098765",
  address: "Hyderabad"
)

User.create(
  first_name: "Rajat",
  last_name: "Mishra",
  contact: "3210987654",
  address: "Pune"
)

User.create(
  first_name: "Nisha",
  last_name: "Rani",
  contact: "2109876543",
  address: "Ahmedabad"
)

User.create(
  first_name: "Arjun",
  last_name: "Choudhary",
  contact: "1098765432",
  address: "Jaipur"
)

User.create(
  first_name: "Meera",
  last_name: "Yadav",
  contact: "9876543210",
  address: "Lucknow"
)




Book.create(
  bookname: "You Can Win",
  author: "Shiv Khera",
  price: 19,
  quantity: 20,
  admin_id: 1 # Assuming admin with ID 1
)

Book.create(
  bookname: "Wings of Fire",
  author: "A.P.J. Abdul Kalam",
  price: 24,
  quantity: 15,
  admin_id: 1
)

Book.create(
  bookname: "The Power of Subconscious Mind",
  author: "Joseph Murphy",
  price: 14,
  quantity: 30,
  admin_id: 1
)

Book.create(
  bookname: "Physics (RD Sharma)",
  author: "R.D. Sharma",
  price: 29,
  quantity: 25,
  admin_id: 1
)

Book.create(
  bookname: "Atal Bihari Book",
  author: "Atal Bihari Vajpayee",
  price: 9,
  quantity: 10,
  admin_id: 1
)




user_ids = [1, 2, 3] 
book_ids = [1, 2, 3]    
user_ids.each do |user_id|
  book_ids.each do |book_id|
  	quantity = rand(1..10) 
    Order.create(
      quantity: quantity,
      user_id: user_id,
      book_id: book_id
    )
  end
end



user_ids = [1, 2, 3] 
book_ids = [1, 2, 3]    
order_ids=[1,2,3,3,4]
comment_arr=["good","avarage","exelent"]
user_ids.each do |user_id|
  book_ids.each do |book_id|
  	order_ids.each do |order_ids|
    quantity = rand(1..5)   
    comment=comment_arr(rand(comment_arr.length))
    rate=rand(1..5)
    Rating.create(
    rate:rate
    comment: comment
    user_id:user_id
    order_id:order_id
    book_id: book_id 
    )
  
  end
end


all_orders = Order.joins(:user, :book)
all_orders.each do |order|
  puts "Order ID: #{order.id}"
  puts "User: #{order.user.first_name} #{order.user.last_name}"
  puts "Book: #{order.book.bookname} by #{order.book.author}"
  puts "Quantity: #{order.quantity}"
  puts ""
end


=end 

 