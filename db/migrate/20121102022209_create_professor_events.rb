class CreateProfessorEvents < ActiveRecord::Migration
  def change
    create_table :professor_events do |t|
      t.integer :userID
      t.integer :eventID
      t.integer :courseID

      t.timestamps
    end
  end
end
