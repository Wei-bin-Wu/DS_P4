class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :exam, null: false, foreign_key: true
      t.integer :note, null:false, :in => 0..10
      t.string :photo, :limit => 128

      t.timestamps
    end
  end
end
