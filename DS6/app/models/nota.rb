class Nota < ApplicationRecord
  belongs_to :alumnos
  belongs_to :examenes
end
