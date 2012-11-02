class CreateSectionEvents < ActiveRecord::Migration
  def change
    create_table :section_events do |t|
      t.integer :sectionID
      t.integer :eventID

      t.timestamps
    end
  end
end
