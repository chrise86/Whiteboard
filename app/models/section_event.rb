class SectionEvent < ActiveRecord::Base
  attr_accessible :event_id, :section_id, :start_date, :end_date
  belongs_to :section, :foreign_key => :section_id
  belongs_to :event, :foreign_key => :event_id
end
