json.extract! user, :id, :name, :birthday, :gender, :created_at, :updated_at
json.url user_url(user, format: :json)
