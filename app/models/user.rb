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

  # Ian Graham
  # Returns an array of all the sections a user belongs to
  def sections
    # Get an array of UserSections for the user, then go through each of those UserSections, and pull out the section
   UserSection.where(:user_id => id).collect { |us| Section.find_by_id(us.section_id) }
  end

  def find_sections_events
    sections_events = {}
    sections.each do |section|
      events = section.find_all_events_with_id_title_and_time
      sections_events[section] = events
    end
    sections_events
  end
  
  # Returns an array of all the sections a user belongs to
  def find_all_sections_formatted
    # Get an array of UserSections for the user, then go through each of those UserSections, and pull out the section
    sections.collect { |s| { :id => s.id, :name => s.name } }
  end

  # Returns an array formatted as: [ section => [events, events, events, etc], etc ]
  def find_all_sections_and_their_events
    # Get the array of sections for a user, then go through each section and create a hash where
    # the key is the section, and the value is an array of events for that particular section.
    sections.collect { |s| {s => s.events} }
  end

  # Returns sections and events in the following format:
  #[{:course_name=>"ITEC3101",
  #  :section_id=>58,
  #  :event_id=>37,
  #  :event_title=>"Event 37",
  #  :end_date=>Sat, 01 Dec 2012 01:51:46 UTC +00:00},
  #    {:course_name=>"ITEC3101",
  #     :section_id=>58,
  #     :event_id=>40,
  #     :event_title=>"Event 40",
  #     :end_date=>Thu, 29 Nov 2012 18:03:38 UTC +00:00}, etc]
  def find_all_sections_and_their_events_formatted
    # Get the array of sections for a user, then go through each section and create a hash where
    # the key is the section, and the value is an array of events for that particular section.
    sections.collect { |s| s.find_all_events_with_id_title_and_time }.flatten
  end


  def find_professor_courses
    ProfessorEvent.where(:user_id => id).collect {|prof_event| Course.find_by_id(prof_event.course_id)}.uniq
  end

  def find_courses_events
    course_events = {}
    courses = find_professor_courses
    courses.each do |course|
      events = find_professor_events(course)
      course_events[course] = events
    end
    course_events
  end

  def find_professor_events(course)
    events = ProfessorEvent.where(:user_id => id,
                                  :course_id => course.id)
    events.collect! {|e| Event.find_by_id(e.event_id)}
  end

  def find_professor_sections
    #find all of the sections under the list of professor courses
    professor_courses = find_professor_courses
    course_sections = {}
    professor_courses.each do |course|
      course_sections[course] = Section.where(:course_id => course.id)
    end

    #find all of the user sections under the professor's user ID
    user_sections = sections

    #filter out the sections that the professor actually has
    #for every section in the list of sections extracted from professor courses,
    #compare it to each section in user_section and store the matches in a new list
    #of sections
    courses_sections = {}
    course_sections.each do |course, sections|
      new_sections = []
      sections.each do |a_section|
        user_sections.each do |section|
          new_sections << section if a_section.id.eql?(section.id)
        end
      end
      courses_sections[course] = new_sections unless new_sections.blank?
    end
    courses_sections
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
