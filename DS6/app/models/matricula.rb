class Matricula < ApplicationRecord
  belongs_to :asignaturas
  belongs_to :alumnos
end
