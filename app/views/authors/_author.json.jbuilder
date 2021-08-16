json.extract! author, :id, :name, :dob, :biography, :created_at, :updated_at
json.url author_url(author, format: :json)
