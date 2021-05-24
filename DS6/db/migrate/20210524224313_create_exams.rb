class CreateExams < ActiveRecord::Migration[6.1]
  def change
    create_table :exams do |t|
      t.string :name, :limit => 32, null: false
      t.date :date
      t.belongs_to :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
