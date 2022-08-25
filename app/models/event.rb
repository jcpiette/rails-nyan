class Event < ApplicationRecord
  belongs_to :user #Admin User
  has_many :users, through: :event_members #Invited members
end
