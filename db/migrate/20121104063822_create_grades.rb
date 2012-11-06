class CreateGrades < ActiveRecord::Migration
  def change
      create_table :grades do |t|
      t.integer :gradebookID
      t.decimal :grade, :scale => 5, :precision => 2
      t.string :file

      t.timestamps
    end
  end
end
