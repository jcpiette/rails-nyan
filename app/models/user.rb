class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #relation
  has_many :events, dependent: :destroy #Event owner
  has_many :event_members, dependent: :destroy
  has_many :users, through: :user_friends
end
