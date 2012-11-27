class ProfessorEvent < ActiveRecord::Base
  attr_accessible :course_id, :event_id, :user_id
  belongs_to :course, :foreign_key => :course_id
  belongs_to :event, :foreign_key => :event_id
  belongs_to :user, :foreign_key => :user_id
end
