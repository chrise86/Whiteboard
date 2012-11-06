class AddUserResponseToUserResponses < ActiveRecord::Migration
  def up
    add_column :user_responses, :userResponse, :string
  end
  def down
    remove_column :user_responses, :userResponse
  end
end
