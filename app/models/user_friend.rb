class UserFriend < ApplicationRecord
  belongs_to :user
  has_many :users, through: :users #Friends link
end
