json.extract! examene, :id, :nombre, :fecha, :asignaturas_id, :created_at, :updated_at
json.url examene_url(examene, format: :json)
