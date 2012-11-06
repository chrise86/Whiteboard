class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.integer :multipleChoiceID
      t.integer :userID
      t.string :userResponse

      t.timestamps
    end
  end
end
