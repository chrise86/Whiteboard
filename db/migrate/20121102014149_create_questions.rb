class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :event_id
      t.integer :category
      t.text :description

      t.timestamps
    end
  end
end
