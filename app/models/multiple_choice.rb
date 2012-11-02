class MultipleChoice < ActiveRecord::Base
  attr_accessible :answer, :choice1, :choice2, :choice3, :choice4, :eventID, :questionID
end
