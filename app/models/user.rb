class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  #relation
  has_many :events, dependent: :destroy #Event owner
  has_many :event_members, dependent: :destroy
  has_many :groups, through: :group_members #Invited members
  has_many :friends, class_name: "UserFriends", foreign_key: :friend_id
  has_many :user_friends, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_one_attached :photo

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = provider_data.info.name
      user.last_name = provider_data.info.name
    end
  end
end
