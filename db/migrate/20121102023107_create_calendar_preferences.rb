class CreateCalendarPreferences < ActiveRecord::Migration
  def change
    create_table :calendar_preferences do |t|
      t.integer :user_id
      t.boolean :grades_shown

      t.timestamps
    end
  end
end
