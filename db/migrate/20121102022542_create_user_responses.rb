class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.integer :multiple_choice_id
      t.integer :user_id
      t.string :user_response

      t.timestamps
    end
  end
end
