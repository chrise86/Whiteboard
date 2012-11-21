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

  # Returns an array of all the sections a user belongs to
  def find_all_sections
    # Get an array of UserSections for the user, then go through each of those UserSections, and pull out the section
   UserSection.where(:user_id => id).map { |us| Section.find_by_id(us.section_id) }
  end

  # Returns an array formatted as: [ section => [events, events, events, etc], etc ]
  def find_all_sections_and_their_events
    # Get the array of sections for a user, then go through each section and create a hash where
    # the key is the section, and the value is an array of events for that particular section.
    find_all_sections.map { |s| {s => s.find_all_events} }
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
      events = self.find_professor_events(course)
      course_events[course.id] = events
    end
    course_events
  end

  def find_professor_events(course)
    events = ProfessorEvent.where(:user_id => self.id,
                                  :course_id => course.id)
    events.collect! {|e| Event.find_by_id(e.event_id)}
  end

  #every section under this category has the events for a particular course

  def find_professor_sections_events
    course_sections = ProfessorEvent.find_professor_sections(self)
    sections_events = {}
    course_sections.keys.each do |course|
      events = self.find_professor_events(course)
      sections_events[course_sections] = events
    end
    sections_events
  end

end
