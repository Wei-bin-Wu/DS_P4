json.extract! professor, :id, :name, :surname, :phone, :email, :pass, :created_at, :updated_at
json.url professor_url(professor, format: :json)
