class Gradebook < ActiveRecord::Base
  attr_accessible :attachment, :eventID, :grade, :sectionID, :userID
end
