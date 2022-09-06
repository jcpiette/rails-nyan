json.extract! notifcation, :id, :message, :is_read, :user_id, :created_at, :updated_at
json.url notifcation_url(notifcation, format: :json)
