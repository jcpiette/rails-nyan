class Event < ApplicationRecord
  belongs_to :user #Admin User
  has_many :event_members
  has_many :users, through: :event_members #Invited members
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
