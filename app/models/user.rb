class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #relation
  has_many :events, dependent: :destroy #Event owner
  has_many :event_members, dependent: :destroy
  has_many :groups, through: :group_members #Invited members
  has_many :friends, class_name: "UserFriends", foreign_key: :friend_id
  has_many :user_friends
end
