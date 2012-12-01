class CreateProfessorEvents < ActiveRecord::Migration
  def change
    create_table :professor_events do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :course_id
      t.integer :semester_id

      t.timestamps
    end
  end
end
