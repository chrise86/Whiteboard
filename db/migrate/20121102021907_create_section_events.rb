class CreateSectionEvents < ActiveRecord::Migration
  def change
    create_table :section_events do |t|
      t.integer :section_id
      t.integer :event_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
