class Grade < ActiveRecord::Base
  attr_accessible :grade_id, :grade, :file
  belongs_to :gradebook, :foreign_key => :grade_id
  self.primary_key = :grade_id
end
