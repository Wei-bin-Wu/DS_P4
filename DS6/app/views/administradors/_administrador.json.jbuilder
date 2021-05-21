json.extract! administrador, :id, :nombre, :apellido, :num_tlf, :email, :pass, :created_at, :updated_at
json.url administrador_url(administrador, format: :json)
