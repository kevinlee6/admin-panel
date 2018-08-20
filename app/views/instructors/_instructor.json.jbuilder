json.extract! instructor, :id, :first_name, :last_name, :age, :salary, :education, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
