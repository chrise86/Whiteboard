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
    SectionEvent.where(:section_id => id).select { |se| se.end_date.month == month }
  end

  # Ian Graham
  def semester
    semester_id%3
  end

  # Ian Graham
  # Returns the semester_id number which would normally be returned by the section's parameter.
  # The purpose of this method is to give the ability to determine which particular semester
  # the passed in date is in (or just the current date)
  def Section.date_to_semester_num(date = Date.today)
    year = (date.year.to_i - 2011)*3
    if spring_semester? date
      return year
    elsif summer_semester? date
      return year + 1
    elsif fall_semester? date
      return year + 2
    end
  end

  # Ian Graham
  # Returns a boolean value depicting whether or not the date parameter passed in is within the range
  # of dates of the Spring semester.
  def Section.spring_semester?(date = Date.today)
    (Date.new(date.year, 1, 7)..Date.new(date.year, 5, 7)).include? date
  end

  # Ian Graham
  # Returns a boolean value depicting whether or not the date parameter passed in is within the range
  # of dates of the Summer semester.
  def Section.summer_semester?(date = Date.today)
    (Date.new(date.year, 5, 21)..Date.new(date.year, 7, 28)).include? date
  end

  # Ian Graham
  # Returns a boolean value depicting whether or not the date parameter passed in is within the range
  # of dates of the Fall semester.
  def Section.fall_semester?(date = Date.today)
    (Date.new(date.year, 8, 14)..Date.new(date.year, 12, 7)).include? date
  end

  # Ian Graham
  def semester_start
    current_year = Date.today.year
    if semester == 0
      Date.new(current_year, 1, 7)
    elsif semester == 1
      return Date.new(current_year, 5, 21)
    elsif semester == 2
      return Date.new(current_year, 8, 14)
    end
  end

  # Ian Graham
  def semester_end
    current_year = Date.today.year
    if semester == 0
      Date.new(current_year, 5, 7)
    elsif semester == 1
      return Date.new(current_year, 7, 28)
    elsif semester == 2
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
