# Clean Database
puts 'Cleaning...'

User.destroy_all
Notification.destroy_all

puts 'Database cleaned!'

# Create Users
puts 'Creating users...'

user1 = User.create!(first_name: 'Paulo', last_name: 'Gomes', email: "pjgomes85@hotmail.com", password: "Test123", latitude: '51.498356', longitude: '-0.176894', preference_type: 'restaurant', preference_budget: '4')
user2 = User.create!(first_name: 'Theo', last_name: 'Simpson', email: "kmstheodore@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
user3 = User.create!(first_name: 'Olivia', last_name: 'Patterson', email: "oliviapatterson123@live.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
user4 = User.create!(first_name: 'Jay', last_name: 'P.', email: "piette.jc@me.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
User.create!(first_name: 'Clarke', last_name: 'Kent', email: "ckent@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
User.create!(first_name: 'Gary', last_name: 'Barlow', email: "gbarlow@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
User.create!(first_name: 'Jack', last_name: 'Smith', email: "jsmith@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
User.create!(first_name: 'Stephanie', last_name: 'Knowles', email: "sknowles@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')
User.create!(first_name: 'Anna', last_name: 'Dobbs', email: "adobbs@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4')

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

event1 = Event.create!(
  title: 'Le Wagon Alumni Lunch',
  description: 'Meeting up for lunch with the gang.',
  user_id: user3
)
EventMember.create!(user_id: user1, event_id: event1)
EventMember.create!(user_id: user2, event_id: event1)
EventMember.create!(user_id: user4, event_id: event1)

Event.create!(
  title: 'Family BBQ',
  description: 'Come along for some good grub ft. my famous ham sandwhiches',
  user_id: user3
)

Event.create!(
  title: 'Pottery Class',
  description: 'Join me for a fun and creative pottery class.',
  user_id: user3
)

event4 = Event.create!(title: 'Birthday Bash', description: "Celebrating Theo's Birthday", user_id: user2)
EventMember.create!(user_id: user1, event_id: event4)
EventMember.create!(user_id: user3, event_id: event4)
EventMember.create!(user_id: user4, event_id: event4)


puts 'Events created!'

# Create User Friends
puts 'Adding User Friends...'

UserFriend.create!()

puts 'Friends Created!'
