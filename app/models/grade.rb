class Grade < ActiveRecord::Base
  attr_accessible :gradebook_id, :grade, :file
  belongs_to :gradebook, :foreign_key => :gradebook_id
end
