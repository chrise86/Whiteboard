class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :course_id
      t.integer :section_number
      t.integer :semester_id

      t.timestamps
    end
  end
end
