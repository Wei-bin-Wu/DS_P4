class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name, :limit => 32, null: false
      t.belongs_to :professor, null: false, foreign_key: true

      t.timestamps
    end
    add_index :subjects, :name, unique: true
  end
end
