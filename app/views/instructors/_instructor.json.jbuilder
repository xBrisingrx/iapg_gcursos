json.extract! instructor, :id, :name, :description, :active, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
