class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :semester_id
  has_many :gradebooks
  has_many :user_sections
  has_many :users, :through => :user_sections
  has_many :section_events
  has_many :events, :through => :section_events
  belongs_to :course, :foreign_key => :course_id

  def find_all_events
    SectionEvent.where(:section_id => id).collect { |se| Event.find_by_id(se.event_id) }
  end

  def find_all_events_with_id_title_and_time
    find_all_events.collect { |e|
      {
          :course_name => name,
          :section_id => id,
          :event_id => e.id,
          :event_title => e.title,
          :end_date => SectionEvent.where(:section_id => id, :event_id => e.id).first.end_date
      }
    }
  end

  def find_all_sections_for_month(month = Date.today.month)
    SectionEvent.where(:section_id => id).select { |se| end_date.month == Date.today.month }
  end

  def name
    course.name
  end

  def course
    Course.find_by_id(course_id)
  end

  def long_name
    "#{name} - #{section_number}"
  end

end
