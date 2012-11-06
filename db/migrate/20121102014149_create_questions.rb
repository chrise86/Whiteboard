class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :eventID
      t.integer :type
      t.text :description

      t.timestamps
    end
  end
end
