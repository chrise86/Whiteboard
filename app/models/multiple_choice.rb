class MultipleChoice < ActiveRecord::Base
  attr_accessible :questionID, :answer, :choice1, :choice2, :choice3, :choice4
  has_many :user_responses
  belongs_to :question, :foreign_key => :questionID
end