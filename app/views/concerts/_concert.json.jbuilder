json.extract! concert, :id, :user_id, :goup_id, :venue, :date, :adress, :created_at, :updated_at
json.url concert_url(concert, format: :json)
