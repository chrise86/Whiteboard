class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :courseID
      t.integer :sectionNumber
      t.integer :semesterID
      t.string :professor

      t.timestamps
    end
  end
end
