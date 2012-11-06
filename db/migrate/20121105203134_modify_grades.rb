class ModifyGrades < ActiveRecord::Migration
  def up
      drop_table :grades
      create_table :grades, {:primary_key => :gradeID} do |t|
        t.integer :gradeID
        t.decimal :grade, :scale => 5, :precision => 2
        t.string :file

        t.timestamps
      end
  end

  def down
    drop_table :grades
    create_table :grades, :id => false do |t|
      t.integer :gradeID
      t.decimal :grade, :scale => 5, :precision => 2
      t.string :file

      t.timestamps
    end
  end
end
