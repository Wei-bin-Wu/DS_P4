json.extract! nota, :id, :alumnos_id, :examenes_id, :nota, :foto, :created_at, :updated_at
json.url nota_url(nota, format: :json)
