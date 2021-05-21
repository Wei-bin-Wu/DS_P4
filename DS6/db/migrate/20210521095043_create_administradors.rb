class CreateAdministradors < ActiveRecord::Migration[6.1]
  def change
    create_table :administradors do |t|
      t.string :nombre, :limit => 16
      t.string :apellido, :limit => 32
      t.string :num_tlf, :limit => 9
      t.string :email, :limit => 32
      t.string :pass, :limit => 100

      t.timestamps
    end
    add_index :administradors, :email, unique: true
    change_column_null :nombre, :apellido, :email, :pass false
  end
end
