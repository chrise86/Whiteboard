class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :eventID, :null => false
      t.integer :type, :null => false
      t.text :description, :null => false

      t.timestamps
    end
  end
end
