class ModifyUserResponses < ActiveRecord::Migration
  def up
    remove_column :user_responses, :questionID
    remove_column :user_responses, :eventID
    add_column :user_responses, :multipleChoiceID, :integer
  end

  def down
    remove_column :user_responses, :multipleChoiceID
    add_column :user_responses, :questionID, :integer
    add_column :user_responses, :eventID, :integer
  end
end
