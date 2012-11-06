class CreateGradebooks < ActiveRecord::Migration
  def change
    create_table :gradebooks do |t|
      t.integer :event_id
      t.integer :section_id
      t.integer :user_id

      t.timestamps
    end
  end
end
