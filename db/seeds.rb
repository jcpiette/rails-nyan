#Clean Database
puts 'Cleaning...'

User.destroy_all
Notification.destroy_all

puts 'Database cleaned!'

#Create Users
puts 'Creating users...'

user1 = User.create!(first_name: "Paulo", last_name: "Gomes", email: "pjgomes85@hotmail.com", password: "Test123")
user2 = User.create!(first_name: "Theo", last_name: "P.", email: "kmstheodore@gmail.com", password: "Test123")
user3 = User.create!(first_name: "Olivia", last_name: "S.", email: "oliviapatterson123@live.com", password: "Test123")
user4 = User.create!(first_name: "jay", last_name: "P.", email: "piette.jc@me.com", password: "Test123")

puts 'Users created!'

#Create notifications
puts 'Creating notifications...'

Notification.create!(message: "Lorem Ipsum 1", is_read: 1, user: user1)
Notification.create!(message: "Lorem Ipsum 2", is_read: 1, user: user1)
Notification.create!(message: "Lorem Ipsum 3", is_read: 0, user: user1)
Notification.create!(message: "Lorem Ipsum 4", is_read: 0, user: user1)

Notification.create!(message: "Lorem Ipsum 1", is_read: 1, user: user2)
Notification.create!(message: "Lorem Ipsum 2", is_read: 1, user: user2)
Notification.create!(message: "Lorem Ipsum 3", is_read: 0, user: user2)
Notification.create!(message: "Lorem Ipsum 4", is_read: 0, user: user2)

Notification.create!(message: "Lorem Ipsum 1", is_read: 1, user: user3)
Notification.create!(message: "Lorem Ipsum 2", is_read: 1, user: user3)
Notification.create!(message: "Lorem Ipsum 3", is_read: 0, user: user3)
Notification.create!(message: "Lorem Ipsum 4", is_read: 0, user: user3)

Notification.create!(message: "Lorem Ipsum 1", is_read: 1, user: user4)
Notification.create!(message: "Lorem Ipsum 2", is_read: 1, user: user4)
Notification.create!(message: "Lorem Ipsum 3", is_read: 0, user: user4)
Notification.create!(message: "Lorem Ipsum 4", is_read: 0, user: user4)

puts 'Notifications created!'
