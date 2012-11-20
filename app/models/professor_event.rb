class ProfessorEvent < ActiveRecord::Base
  attr_accessible :course_id, :event_id, :user_id
  belongs_to :course, :foreign_key => :course_id
  belongs_to :event, :foreign_key => :event_id
  belongs_to :user, :foreign_key => :user_id

  def self.find_courses_for_user(user_id)
    professor_events = ProfessorEvent.where(:user_id => user_id)
    courses = []
    professor_events.each do |prof_event|
      courses << Course.find(:id => prof_event.course_id)
    end
  end

end
