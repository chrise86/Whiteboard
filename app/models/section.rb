class Section < ActiveRecord::Base
  attr_accessible :course_id, :section_number, :semester_id
  has_many :gradebooks
  has_many :user_sections
  has_many :users, :through => :user_sections
  has_many :section_events
  has_many :events, :through => :section_events
  belongs_to :course, :foreign_key => :course_id

  def self.find_all_for_user(user_id)
    user_section = UserSection.where(:user_id => user_id)

    section = []
    user_section.each do |us|
      temp = Section.find_by_id(us.section_id)
      section << temp
    end
    section
  end

  def self.user_course_sections(user_id)
    #Get all of the sections for this professor, and show the data for the sections under that course.
    sections = Section.all_for_user(user_id)
    courses = []
    sections.each do |s|
      a_course = Course.find_by_id(s.course_id)
      #Make sure that courses has unique entries
      courses << a_course if courses.include? a_course == false
    end
    course_sections = {}
    courses.each do |course|
      course_sections[course] = Section.where(:course_id => key.id)
    end
    course_sections
  end

end
