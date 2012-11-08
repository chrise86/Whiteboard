class CreateMultipleChoices < ActiveRecord::Migration
  def change
    create_table :multiple_choices do |t|
      t.integer :question_id
      t.string :choice_1
      t.string :choice_2
      t.string :choice_3
      t.string :choice_4
      t.integer :answer

      t.timestamps
    end
  end
end
