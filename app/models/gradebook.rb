class Gradebook < ActiveRecord::Base
  attr_accessible :eventID, :sectionID, :userID
  has_one :grade
  belongs_to :event, :foreign_key => :eventID
  belongs_to :section, :foreign_key => :sectionID
  belongs_to :user, :foreign_key => :userID
end
