class CreateMatriculas < ActiveRecord::Migration[6.1]
  def change
    create_table :matriculas do |t|
      t.belongs_to :asignaturas, null: false, foreign_key: true
      t.belongs_to :alumnos, null: false, foreign_key: true

      t.timestamps
    end
  end
end
