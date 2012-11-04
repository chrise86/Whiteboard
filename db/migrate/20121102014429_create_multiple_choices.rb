class CreateMultipleChoices < ActiveRecord::Migration
  def change
    create_table :multiple_choices do |t|
      t.integer :questionID, null => false
      t.string :choice1, :null => false
      t.string :choice2, :null => false
      t.string :choice3
      t.string :choice4
      t.integer :answer, :null => false

      t.timestamps
    end
  end
end
