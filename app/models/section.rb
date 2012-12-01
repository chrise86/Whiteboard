class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :semester_id, :meeting_days
  has_many :gradebooks
  has_many :user_sections
  has_many :users, :through => :user_sections
  has_many :section_events
  has_many :events, :through => :section_events
  belongs_to :course, :foreign_key => :course_id

  def events
    SectionEvent.where(:section_id => id).collect { |se| Event.find_by_id(se.event_id) }
  end

  def find_all_events_with_id_title_and_time
    events.collect { |e|
      {
          :course_name => name,
          :section_id => id,
          :event_id => e.id,
          :event_title => e.title,
          :end_date => SectionEvent.where(:section_id => id, :event_id => e.id).first.end_date
      }
    }
  end

  # Ian Graham
  def days
    meeting_days.split("").collect {|day| day.to_i}
  end

  def find_all_sections_for_month(month = Date.today.month)
    SectionEvent.where(:section_id => id).select { |se| end_date.month == Date.today.month }
  end

  # Ian Graham
  def semester_start
    current_year = Date.today.year
    if semester_id == 1
      Date.new(current_year, 1, 7)
    elsif semester_id == 2
      return Date.new(current_year, 5, 21)
    elsif semester_id == 3
      return Date.new(current_year, 8, 14)
    end
  end

  # Ian Graham
  def semester_end
    current_year = Date.today.year
    if semester_id == 1
      Date.new(current_year, 5, 7)
    elsif semester_id == 2
      return Date.new(current_year, 7, 28)
    elsif semester_id == 3
      return Date.new(current_year, 12, 7)
    end
  end

  # Ian Graham
  def name
    course.name
  end

  # Ian Graham
  def course
    Course.find_by_id(course_id)
  end

  # Ian Graham
  def professor
    User.find_by_id(UserSection.where(:section_id => id).first.user_id)
  end

  # Ian Graham
  def long_name
    "#{name} - #{section_number}"
  end

  def professor_events
    ProfessorEvent.where(:user_id => professor.id, :course_id => course.id).collect {|prof_event|
      Event.find_by_id(prof_event.event_id)}
  end

end
