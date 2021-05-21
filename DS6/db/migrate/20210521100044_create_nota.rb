class CreateNota < ActiveRecord::Migration[6.1]
  def change
    create_table :nota do |t|
      t.belongs_to :alumnos, null: false, foreign_key: true
      t.belongs_to :examenes, null: false, foreign_key: true
      t.integer :nota
      t.string :foto

      t.timestamps
    end
  end
end
