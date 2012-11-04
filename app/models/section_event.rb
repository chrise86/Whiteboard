class SectionEvent < ActiveRecord::Base
  attr_accessible :eventID, :sectionID
  belongs_to :section, :foreign_key => :sectionID
  belongs_to :event, :foreign_key => :eventID
end
