class CreateCalendarPreferences < ActiveRecord::Migration
  def change
    create_table :calendar_preferences do |t|
      t.integer :userID
      t.boolean :gradesShown

      t.timestamps
    end
  end
end
