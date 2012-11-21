class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :semester_id
  has_many :gradebooks
  has_many :user_sections
  has_many :users, :through => :user_sections
  has_many :section_events
  has_many :events, :through => :section_events
  belongs_to :course, :foreign_key => :course_id

  def find_all_events
    SectionEvent.where(:section_id => self.id).collect {|e| Event.find_by_id(e.event_id)}
  end

  def self.user_course_sections(user)
    #Get all of the sections for this professor, and show the data for the sections under that course.
    sections = user.find_all_sections
    courses = []
    sections.each do |s|
      a_course = Course.find_by_id(s.course_id)
      #Make sure that courses has unique entries
      courses << a_course unless courses.include? a_course
    end
    course_sections = {}
    courses.each do |course|
      course_sections[course] = Section.where(:course_id => key.id)
    end
    course_sections
  end

  def as_json(options={})
    sections = User.first.find_all_sections
    events_per_section = {}
    sections.each do |section|
      events = Event.find_all_for_section(section.id)
      data_list = []
      events.each do |event|
        data_list << [event.id, event.title, event.end]
      end
      events_per_section[s.id] = data_list
    end
    events_per_section.to_json
  end

end
