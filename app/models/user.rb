class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :first_name, :last_name
  has_one :calendar_preferences
  has_many :categories
  has_many :user_responses
  has_many :gradebooks
  has_many :professor_events
  has_many :user_sections
  has_many :sections, :through => :user_sections

  def find_all_sections
    user_section = UserSection.where(:user_id => self.id)

    section = []
    user_section.each do |us|
      temp = Section.find_by_id(us.section_id)
      section << temp
    end
    section
  end

  def find_professor_courses
    professor_events = ProfessorEvent.where(:user_id => self.id)
    courses = []
    professor_events.each do |prof_event|
      courses << Course.find_by_id(prof_event.course_id)
    end
    courses
  end

  def find_courses_events
    course_events = {}
    courses = self.find_professor_courses
    courses.each do |course|
      events = ProfessorEvent.where(:user_id => self.id, :course_id => course.id)
      course_events[course.id] = events
    end
    course_events
  end


  #every section under this category has the events for a particular course

  def find_professor_sections_events
    course_sections = ProfessorEvent.find_professor_sections(self)
    sections_events = {}
    course_sections.each do |course, sections|
      events = ProfessorEvent.where(:user_id => self.id, :course_id => course.id)
      sections_events[sections] = events
    end
    sections_events
  end

end
