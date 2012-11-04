class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :courseID, :null => false
      t.integer :sectionNumber, :null => false
      t.integer :semesterID, :null => false
      t.string :professor, :null => false

      t.timestamps
    end
  end
end
