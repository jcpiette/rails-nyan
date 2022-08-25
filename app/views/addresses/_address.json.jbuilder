json.extract! address, :id, :street, :zip_code, :city, :country, :is_default, :user_id, :created_at, :updated_at
json.url address_url(address, format: :json)
