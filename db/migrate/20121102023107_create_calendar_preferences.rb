class CreateCalendarPreferences < ActiveRecord::Migration
  def change
    create_table :calendar_preferences do |t|
      t.integer :userID, :null => false
      t.boolean :gradesShown, :null => false

      t.timestamps
    end
  end
end
