class CreateProfessors < ActiveRecord::Migration[6.1]
  def change
    create_table :professors do |t|
      t.string :name, :limit => 16, null: false
      t.string :surname, :limit => 32, null: false
      t.string :phone, :limit => 9
      t.string :email, :limit => 32, null: false
      t.string :pass, :limit => 100, null: false

      t.timestamps
    end
    add_index :professors, :email, unique: true
  end
end
