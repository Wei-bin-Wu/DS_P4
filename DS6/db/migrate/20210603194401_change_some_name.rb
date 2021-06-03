class ChangeSomeName < ActiveRecord::Migration[6.0]
  def change
    rename_column :notes, :note, :nota
  end
end