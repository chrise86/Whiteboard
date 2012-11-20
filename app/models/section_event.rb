class SectionEvent < ActiveRecord::Base
  attr_accessible :event_id, :section_id, :start, :end
  belongs_to :section, :foreign_key => :section_id
  belongs_to :event, :foreign_key => :event_id
end
