# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

first_user = User.create(name: 'John', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'James', photo: 'https://images.unsplash.com/photo-1508922088233-a07c9cc6972f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80', bio: 'Teacher from Poland.')

first_post = Post.create(author: User.first, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: User.second, title: 'This is my second post!', text: 'Second comment')
third_post = Post.create(author: second_user, title: 'Hello everyone!', text: 'I am new on this')
fourth_post = Post.create(author: second_user, title: 'Microverse', text: 'This is very cool')

Comment.create(post: first_post, author: second_user, text: 'Hi Tom!')
Comment.create(post: first_post, author: first_user, text: 'Hi Lilly, How was your day?')
Comment.create(post: first_post, author: second_user, text: 'I am very well, thank you')
Comment.create(post: second_post, author: second_user, text: 'Congrats for your second post')
Comment.create(post: third_post, author: first_user, text: 'Welcome to my new blog!')
Comment.create(post: fourth_post, author: first_user, text: 'You are right, it is very cool')