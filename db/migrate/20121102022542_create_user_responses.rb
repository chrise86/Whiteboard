class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.integer :eventID
      t.integer :userID
      t.integer :questionID

      t.timestamps
    end
  end
end
