json.extract! student, :id, :name, :surname, :phone, :email, :pass, :address, :created_at, :updated_at
json.url student_url(student, format: :json)
