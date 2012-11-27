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
  #also need a query to this list which gets all events in a section on a particular day.
  #this requires a call to a section in the hash, and then iterating through every event
  #and looking at individual if blocks for each day to ask whether the event ends on the
  #particular day
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

  def find_events_on_day(day = 0)
    events = find_all_events_with_id_title_and_time
    if day == 0
      sunday_events = []
      events.each do |event|
        sunday_events << event if event.values[4].sunday?
      end
      return sunday_events
    end
    if day == 1
      monday_events = []
      events.each do |event|
        monday_events << event if event.values[4].monday?
      end
      return monday_events
      end
    if day == 2
      tuesday_events = []
      events.each do |event|
        tuesday_events << event if event.values[4].tuesday?
      end
      return tuesday_events
      end
    if day == 3
      wednesday_events = []
      events.each do |event|
        wednesday_events << event if event.values[4].wednesday?
      end
      return wednesday_events
      end
    if day == 4
      thursday_events = []
      events.each do |event|
        thursday_events << event if event.values[4].thursday?
      end
      return thursday_events
      end
    if day == 5
      friday_events = []
      events.each do |event|
        friday_events << event if event.values[4].friday?
      end
      return friday_events
      end
    if day == 6
      saturday_events = []
      events.each do |event|
        saturday_events << event if event.values[4].saturday?
      end
      return saturday_events
    end
  end

  def find_all_sections_for_month(month = Date.today.month)
    SectionEvent.where(:section_id => id).select { |se| end_date.month == Date.today.month }
  end

  def name
    Course.find_by_id(course_id).name
  end

  def long_name
    "#{name} - #{section_number}"
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
