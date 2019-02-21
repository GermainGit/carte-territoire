json.extract! photo, :id, :title, :content, :long, :lat, :date, :user_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
