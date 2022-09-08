# Clean Database
puts 'Cleaning...'

User.destroy_all
Notification.destroy_all

puts 'Database cleaned!'

# Create Users
puts 'Creating users...'

user1 = User.create!(first_name: 'Paulo', last_name: 'Gomes', full_name: "Paulo Gomes", email: "pjgomes85@hotmail.com", password: "Test123", latitude: '51.498356', longitude: '-0.176894', preference_type: 'restaurant', preference_budget: '4')
user2 = User.create!(first_name: 'Theo', last_name: 'P.', full_name: "Theo Simpsons", email: "kmstheodore@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
user3 = User.create!(first_name: 'Olivia', last_name: 'S.', full_name: "Olivia Patterson", email: "oliviapatterson123@live.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
user4 = User.create!(first_name: 'Jay', last_name: 'P.', full_name: "Jean-Charles Piette", email: "piette.jc@me.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')

puts 'Users created!'

# Create notifications
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

# Create Events
puts 'Creating events...'

event1 = Event.create!(title: 'School Leavers Party', description: 'Bye school.', user_id: user3)
EventMember.create!(user_id: user1, event_id: event1)
EventMember.create!(user_id: user2, event_id: event1)

puts 'Events created!'
