class Gradebook < ActiveRecord::Base
  attr_accessible :event_id, :section_id, :user_id
  has_one :grade
  belongs_to :event, :foreign_key => :event_id
  belongs_to :section, :foreign_key => :section_id
  belongs_to :user, :foreign_key => :user_id
end
