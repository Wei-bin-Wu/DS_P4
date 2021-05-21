class CreateExamenes < ActiveRecord::Migration[6.1]
  def change
    create_table :examenes do |t|
      t.string :nombre
      t.date :fecha
      t.belongs_to :asignaturas, null: false, foreign_key: true

      t.timestamps
    end
  end
end
