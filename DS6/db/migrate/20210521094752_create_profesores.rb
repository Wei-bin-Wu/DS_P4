class CreateProfesores < ActiveRecord::Migration[6.1]
  def change
    create_table :profesores do |t|
      t.string :nombre
      t.string :apellido
      t.string :num_tlf
      t.string :email
      t.string :pass

      t.timestamps
    end
    add_index :profesores, :email, unique: true
  end
end
