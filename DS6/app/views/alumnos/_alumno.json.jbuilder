json.extract! alumno, :id, :nombre, :apellido, :num_tlf, :email, :pass, :domicilio, :created_at, :updated_at
json.url alumno_url(alumno, format: :json)
