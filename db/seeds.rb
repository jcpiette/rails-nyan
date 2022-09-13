# Clean Database
puts 'Cleaning...'
UserFriend.destroy_all
EventMember.destroy_all
Event.destroy_all
User.destroy_all
Notification.destroy_all

puts 'Database cleaned!'
# Create Users
puts 'Creating users...'
# us
user1 = User.create!(first_name: 'Paulo', last_name: 'Gomes', full_name: 'Paulo Gomes', email: "pjgomes85@hotmail.com", password: "Test123", latitude: '51.498356', longitude: '-0.176894', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058301/xclthgkn9itvuyk8szg7.jpg") #imperial college
user2 = User.create!(first_name: 'Theo', last_name: 'Simpson', full_name: 'Theo Simpson', email: "kmstheodore@gmail.com", password: "Test123", latitude: '51.541257', longitude: '-0.153317', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058287/tqque2jr3raeo50hpq0h.jpg")
user3 = User.create!(first_name: 'Olivia', last_name: 'Patterson', full_name: 'Olivia Patterson', email: "oliviapatterson123@live.com", password: "Test123", latitude: '51.5105', longitude: '-0.1872', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058273/udr7otyyxhf72iclmatn.jpg") #queensway
user4 = User.create!(first_name: 'Jay', last_name: 'P.', full_name: 'Jay P.', email: "piette.jc@me.com", password: "Test123", latitude: '51.5556', longitude: '0.1762', preference_type: 'restaurant', preference_budget: '4', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058293/jjbumwkq1nh14xl7c7pr.jpg") #hampstead
# randoms
user5 = User.create!(first_name: 'Harry', last_name: 'Potter', full_name: 'Harry Potter', email: "ckent@gmail.com", password: "Test123", latitude: '51.5445', longitude: '0.1522', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058350/pyxd5dy3hbskqytojxxc.jpg") #chalk farm
user6 = User.create!(first_name: 'Draco', last_name: 'Malfoy', full_name: 'Draco Malfoy', email: "gbarlow@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058358/i5l2n68v2ypwpoyhlrpd.jpg")
user7 = User.create!(first_name: 'Tom', last_name: 'Riddle', full_name: 'Tom Riddle', email: "jsmith@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058319/wunoihihpm4gykc3mzzw.png")
user8 = User.create!(first_name: 'Ginny', last_name: 'Weasley', full_name: 'Ginny Weasley', email: "sknowles@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '4', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058336/zedxch4wlyohxzk49btj.jpg")
user9 = User.create!(first_name: 'Hermione', last_name: 'Granger', full_name: 'Hermione Granger', email: "adobbs@gmail.com", password: "Test123", latitude: '51.50360210286566', longitude: '-0.15148749007201978', preference_type: 'restaurant', preference_budget: '3', img_url:"https://res.cloudinary.com/do31e5zv5/image/upload/w_50,c_fill,ar_1:1,g_auto,r_max,b_rgb:0C2345/v1663058343/aun8xsd66iotnk9vjqvl.jpg")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
# puts 'Users created!'

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user5.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user6.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user7.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user8.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

# file = URI.open("https://res.cloudinary.com/dkywz955g/image/upload/v1661504913/cld-sample.jpg")
# user9.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

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

# Create User Friends
puts 'Adding User Friends...'

# accepted friends
UserFriend.create!(user_id: user3.id, friend_id: user1.id, status: 'Accepted')
UserFriend.create!(user_id: user3.id, friend_id: user2.id, status: 'Accepted')
UserFriend.create!(user_id: user3.id, friend_id: user4.id, status: 'Accepted')

# waiting on them accepting my friend request
UserFriend.create!(user_id: user3.id, friend_id: user5.id, status: 'Pending')

# I can accept and decline
UserFriend.create!(user_id: user6.id, friend_id: user3.id, status: 'Pending')
UserFriend.create!(user_id: user7.id, friend_id: user3.id, status: 'Pending')

puts 'Friends Created!'

# Create Events
puts 'Creating events...'

event1 = Event.create!(
  title: 'Le Wagon Alumni Lunch',
  description: 'Meeting up for lunch with the gang.',
  user_id: user3.id,
  event_date: Date.today + 10

)
EventMember.create!(user_id: user1.id, event_id: event1.id)
EventMember.create!(user_id: user2.id, event_id: event1.id)
EventMember.create!(user_id: user4.id, event_id: event1.id)

# event2 = Event.create!(
#   title: 'Family BBQ',
#   description: 'Come along for some home cooked dinner.',
#   user_id: user3.id,
#   event_date: Date.today + 20
# )
# EventMember.create(user_id: user8.id, event_id: event2.id)
# EventMember.create(user_id: user7.id, event_id: event2.id)


event3 = Event.create!(
  title: 'Pottery Class',
  description: 'Join me for a fun and creative pottery class.',
  user_id: user3.id,
  event_date: Date.today + 30
)
EventMember.create(user_id: user9.id, event_id: event3.id)

puts 'Events created!'
