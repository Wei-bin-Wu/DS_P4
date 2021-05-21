class CreateAsignaturas < ActiveRecord::Migration[6.1]
  def change
    create_table :asignaturas do |t|
      t.string :nombre, :limit => 32
      t.belongs_to :profesores, null: false, foreign_key: true

      t.timestamps
    end
    add_index :asignaturas, :nombre, unique: true
    change_column_null :nombre false
  end
end
