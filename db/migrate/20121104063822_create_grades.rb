class CreateGrades < ActiveRecord::Migration
  def change
      create_table :grades, :id => false do |t|
      t.integer :gradeID
      t.decimal :grade, :scale => 5, :precision => 2
      t.string :file

      t.timestamps
    end
  end
end
