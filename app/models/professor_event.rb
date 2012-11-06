class ProfessorEvent < ActiveRecord::Base
  attr_accessible :courseID, :eventID, :userID
  belongs_to :course, :foreign_key => :courseID
  belongs_to :event, :foreign_key => :eventID
  belongs_to :user, :foreign_key => :userID
end
