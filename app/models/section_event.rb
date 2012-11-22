class SectionEvent < ActiveRecord::Base
  attr_accessible :event_id, :section_id
  belongs_to :section, :foreign_key => :section_id
  belongs_to :events, :foreign_key => :event_id
end
