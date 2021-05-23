class CreateNota < ActiveRecord::Migration[6.1]
  def change
    create_table :nota do |t|
      t.belongs_to :alumnos, null: false, foreign_key: true
      t.belongs_to :examenes, null: false, foreign_key: true
      t.integer :nota, null:false, :in => 0..10
      t.string :foto, :limit => 128

      t.timestamps
    end
  end
end
