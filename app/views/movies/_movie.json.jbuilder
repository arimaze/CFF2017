json.extract! movie, :id, :name, :content_type, :filename, :binary_data, :created_at, :updated_at
json.url movie_url(movie, format: :json)