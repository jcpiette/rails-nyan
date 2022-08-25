class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #relation
  has_many :addresses
  has_many :events #Event owner
  has_many :event_members
  has_many :groups, through: :group_members #Invited members
  has_many :users, through: :user_friends
  has_one :Preferences
end
