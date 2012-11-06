class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.integer :multipleChoiceID, :null => false
      t.integer :userID, :null => false
      t.string :userResponse

      t.timestamps
    end
  end
end
