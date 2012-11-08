class UserResponse < ActiveRecord::Base
  attr_accessible :multiple_choice_id, :user_id, :user_response
  belongs_to :user, :foreign_key => :user_id
  belongs_to :multiple_choice, :foreign_key => :multiple_choice_id
end
