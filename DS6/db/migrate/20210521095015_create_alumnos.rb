class CreateAlumnos < ActiveRecord::Migration[6.1]
  def change
    create_table :alumnos do |t|
      t.string :nombre
      t.string :apellido
      t.string :num_tlf
      t.string :email
      t.string :pass
      t.string :domicilio

      t.timestamps
    end
    add_index :alumnos, :email, unique: true
  end
end
