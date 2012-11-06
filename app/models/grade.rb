class Grade < ActiveRecord::Base
  attr_accessible :gradeID, :grade, :file
  belongs_to :gradebook, :foreign_key => :gradeID
  self.primary_key = :gradeID
end