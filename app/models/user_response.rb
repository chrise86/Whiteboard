class UserResponse < ActiveRecord::Base
  attr_accessible :multipleChoiceID, :userID, :userResponse
  belongs_to :user, :foreign_key => :userID
  belongs_to :multiple_choice, :foreign_key => :multipleChoiceID
end
