json.extract! location, :id, :city, :temp, :created_at, :updated_at
json.url location_url(location, format: :json)
